CONFIG_PATH=/data/options.json

BROKER="$(jq --raw-output '.broker.host' $CONFIG_PATH)"
BROKER_USER="$(jq --raw-output '.broker.username' $CONFIG_PATH)"
BROKER_PASSWORD="$(jq --raw-output '.broker.password' $CONFIG_PATH)"
BOILER="$(jq --raw-output '.boiler' $CONFIG_PATH)"
SERIAL="$(jq --raw-output '.serial' $CONFIG_PATH)"
LOG_LEVEL="$(jq --raw-output '.log' $CONFIG_PATH)"
BIMASTER=`[ "true" = $(jq --raw-output '.bimaster' $CONFIG_PATH) ] && echo "--bimaster" || echo ""`

poll_isystem_mqtt.py --serial $SERIAL --model $BOILER $BIMASTER --user $BROKER_USER --password $BROKER_PASSWORD --log $LOG_LEVEL --interval 60 $BROKER
