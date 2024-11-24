#!/bin/bash

# Functie pentru validarea unei adrese IP
check_ip() {
  result=$(dig +short -x $1)
  if [ -n "$result" ]; then
    echo "Adresa IP $1 este validă."
  else
    echo "Adresa IP $1 nu este validă."
  fi
}

# Citirea fișierului /etc/hosts și validarea IP-urilor
while read -r line; do
  ip=$(echo $line | awk '{print $1}')
  check_ip $ip
done < /etc/hosts

