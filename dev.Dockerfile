FROM devopsfaith/krakend:watch

ENV APP_NAME ${APP_NAME}

WORKDIR /etc/krakend

COPY --chown=krakend check-config.sh .

COPY --chown=krakend krakend.tmpl .
COPY --chown=krakend krakend-compiled.json .
COPY --chown=krakend config ./config

RUN FC_ENABLE=1 \
    FC_OUT="/etc/krakend/krakend-compiled.json" \
    FC_PARTIALS="/etc/krakend/config/partials" \
    FC_SETTINGS="/etc/krakend/config/settings" \
    FC_TEMPLATES="/etc/krakend/config/templates" \
    APP_NAME=$APP_NAME \
    krakend check -d -t -c "/etc/krakend/krakend.tmpl"

RUN ["chmod", "+x", "/etc/krakend/check-config.sh"]

CMD  ["APP_NAME=altosregalos sh check-config.sh"]