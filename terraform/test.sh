#!/bin/bash

modules=()
for m in ./modules/*; do
    modules+=( $(basename $m) )
done
echo "Selected modules: ${modules[@]}"

modules_json=$(jq -c -n '$ARGS.positional' --args "${modules[@]}")
echo $modules_json

matrix={\"module\":$modules_json}
echo $matrix