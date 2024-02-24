#!/usr/bin/env bash
set -o pipefail
set -e
set -f
set -u
set -x
set -o xtrace

# cat cidrs.txt | head -n1 | xargs -I{} sh -c "set -x; masscan -vv -sS --rate=100000 -p0-65535 --interactive --banners --range {}"
# --top-ports 10

#  --source-ip 140.238.121.64

# masscan --shards 1/4 --seed 3 --randomize-hosts --open-only --output-format json -sS --rate=10000000 -p445 --banners -iL  cidrs.txt | xargs -I{} bash -c 'echo "{}" | jq -r ".saddr" | /home/ubuntu/bin/zgrab2 --flush smb'

# echo "-------------------------------------------------------------------------"

# --shards=4 --shard=3 --seed=3

cat cidrs.txt | xargs -d'\n' -I{} zmap --verbosity=0 --quiet --output-filter='success = 1 && repeat = 0' --output-module=json -p 445 -B 10GB {} | jq -rC ' .[] | .' | /home/ubuntu/bin/zgrab2 --flush smb | jq '. | select(.data.smb.result != null)' | jq -r '.ip' | xargs -I% bash -c "set -x; smbclient -N -L %"
