#!/usr/bin/env bash

# Get the JSON file name from the first argument
json_file="$1"

# Check if there's piped input
if [[ -p /dev/stdin ]]; then
    # Read the piped input into a variable
    json_data=$(cat)
else
    # If no piped input, read the JSON data from the file
    json_data=$(cat "$json_file")
fi

# Pass the JSON data to fzf and jq
fzf \
    --disabled \
    --print-query \
    --query="." \
    --preview "jq -C {q} <<< '$json_data'" \
    --prompt="Query: " \
    --header="Interactive jq playground" \
    --preview-window="down:90"
