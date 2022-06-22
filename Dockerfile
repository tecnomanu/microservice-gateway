FROM devopsfaith/krakend:2.0.5 as builder
ARG ENV=prod

COPY krakend.tmpl .
COPY config .

## Save temporary file to /tmp to avoid permission errors
RUN FC_ENABLE=1 \
    FC_OUT=/tmp/krakend.json \
    FC_PARTIALS="/etc/krakend/config/partials" \
    FC_SETTINGS="/etc/krakend/config/settings/$ENV" \
    FC_TEMPLATES="/etc/krakend/config/templates" \
    krakend check -d -t -c krakend.tmpl

# The linting needs the final krakend.json file
RUN krakend check -c /tmp/krakend.json --lint

FROM devopsfaith/krakend:2.0.5
COPY --from=builder --chown=krakend /tmp/krakend.json .
# Uncomment with Enterprise image:
# COPY LICENSE /etc/krakend/LICENSE