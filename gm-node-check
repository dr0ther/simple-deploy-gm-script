#!/bin/bash


declare -a IP_List
  IP_List=( 
  x.x.x.x
  y.y.y.y
  or_dns_name_here.com
  )


for i in "${IP_List[@]}"
do
  echo -e "\n $i check on any LR Nodes:"

  curl -s --request POST \
    --user user:password \
    --url http://$i:8332 \
    --header 'Content-Type: application/json' \
    --data-binary '{"jsonrpc": "1.0", "method": "getpeerinfo"}'  |  jq '.result[] | select(.servicesnames | any(. == "MALICIOUS?")) | "ip=\(.addr) subver=\(.subver) services=\(.servicesnames) misbehavior_score=\(.misbehavior_score) "'


  echo -e "\n $i check on any inbound LR Nodes:"

  curl -s --request POST \
    --user user:password \
    --url http://$i:8332 \
 echo -e "$i check on any LR Nodes:\n"   --header 'Content-Type: application/json' \
    --data-binary '{"jsonrpc": "1.0", "method": "getpeerinfo"}'  |  jq '.result[] | select(.connection_type == "inbound" and (.servicesnames | any(. == "MALICIOUS?")))| "ip=\(.addr) subver=\(.subver) services=\(.servicesnames) misbehavior_score=\(.misbehavior_score) "'


done




 echo -e "\n\n"

