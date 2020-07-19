
#!/bin/bash

set -e
: ${wait_time:="2"}
: ${text:=""}
arg=$1

for i in {1..10};do
  echo "[$i] contando ... wt=${wait_time} ${text} - ARG: $arg"
  sleep ${wait_time}
  if [[ $@ == *"--CURL"*]];then
    CURL HTTP://IFCONFIG.ME
  fi
done