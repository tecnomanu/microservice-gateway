#!/bin/sh
APP_NAME=${APP_NAME:-companyname}

FC_ENABLE=1 \
FC_SETTINGS="$PWD/config/settings" \
FC_PARTIALS="$PWD/config/partials" \
FC_TEMPLATES="$PWD/config/templates" \
FC_OUT="$PWD/krakend-compiled.json" \
APP_NAME="$APP_NAME" \
krakend check -t -d -c "$PWD/krakend.tmpl"

# FC_OUT="$PWD/krakend-compiled.json" \
# krakend check -c krakend-compiled.json --lint