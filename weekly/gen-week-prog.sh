#!/bin/bash

Sheet_Id="1BGm3614htXhX2BDocnOUPSdyQIvPXxcwbZQEq4nDHJU"
Sheet_Range="Sheet1"

# $1 -> file name
replace_comma() {
    local word
    local refined
    local line
    local con=0

    while IFS="\n" read -r line
    do
        con=0
        refined=""
        IFS=","
        for word in $line
        do
            if [[ $word =~ ^\".* ]]; then
                refined+="${word},"
                con=1
            elif [[ $word =~ .*\"$ ]]; then
                refined+="${word}@"
                con=0
            else
                if [[ $con = 1 ]]; then
                    refined+="${word},"
                else
                    refined+="${word}@"
                fi
            fi
            #	printf "$refined\n"
        done
        printf "$refined\n"@ | sed 's/@$//'

    done < $1
}

refined=$(replace_comma tmp.csv)

today=$(date "+%d-%m-%g")

for i in $(seq 0 $(date "+%w") | sort -r)
do
    echo $i
done


# gsheet csv --read --id "$Sheet_Id" --range "$Sheet_Range" > tmp.csv
