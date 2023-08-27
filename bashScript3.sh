#!/usr/bin/bash
if [ "$#" == 0 ]; then
    echo "$#"
    echo "Error: Atleast one argument is required. Which is a name of a country."
    exit 1
else
    for arg in "$@"; do
        curl -s "https://restcountries.com/v3.1/name/${arg}" | jq -r '.[0] | "Name: \(.name.common)\nCapital: \(.capital)\nLanguages: \(.languages)\nPopulation: \(.population)\n\n"' >>result3.txt
        # git shortlog -sn --all | grep "$arg" >>../result.txt
    done
fi
