#!/bin/bash
IP_ADDR="192.168.179."
ROOP_NUM=13

for i in `seq 1 ${ROOP_NUM}`:
do
  STATUS_CODE=`curl -LI http://${IP_ADDR}${i}/active.txt -o /dev/null -w '%{http_code}\n' -m 1 -s`
  if [ "${STATUS_CODE}" = "200" ]; then
    echo ${IP_ADDR}${i}
    break
  fi
done
