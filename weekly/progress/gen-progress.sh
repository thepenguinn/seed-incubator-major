#!/bin/bash

Sheet_Id="1BGm3614htXhX2BDocnOUPSdyQIvPXxcwbZQEq4nDHJU"
Sheet_Range="Sheet1"

Refined=""

Week_Range_Start="01"
Week_Range_End="10"

declare -a Week_Range_Got

# echo "Fetching gsheet..."
# if ! gsheet csv --read --id "$Sheet_Id" --range "$Sheet_Range" > tmp.csv ; then
#     echo "Failed to fetch gsheet. Exiting..."
# fi

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
                refined+="${word#\"},"
                con=1
            elif [[ $word =~ .*\"$ ]]; then
                refined+="${word%\"}@"
                con=0
            else
                if [[ $con = 1 ]]; then
                    refined+="${word},"
                else
                    refined+="${word}@"
                fi
            fi

        done
        echo "$refined" | sed 's/@$//'

    done < $1
}

Refined=$(replace_comma tmp.csv)

for i in $(seq $Week_Range_Start $Week_Range_End)
do
    pi=$(printf "%02d" $i)
    eval "Week_Range_Got+=( \"$(grep -A 6 "Week $pi" <<<"$Refined")\" )"

done

cur_week=""
dir=""

unset IFS

# p1

for week_data in "${Week_Range_Got[@]}"
do
    week_num=$(head -n 1 <<<"$week_data" | cut -f 2 -d @)
    week_dir=$(tr '[:upper:]' '[:lower:]' <<<"$week_num" | tr " " "_")
    week_num=$(cut -f 2 -d " " <<<"$week_num")

    week_dates=$(cut -f 3 -d @ <<<"$week_data" | cut -f 1 -d " ")
    week_dates_holidays=$(sed "s/\(..$\)/20\1/" <<<"$week_dates")

    week_holidays=""

    mid_delim=""
    for i in $(seq 1 7)
    do
        mid_delim="$mid_delim}{\n"
    done
    mid_delim=$(printf "$mid_delim")

    end_delim=""
    for i in $(seq 1 6)
    do
        end_delim="$end_delim} \\\\\\\\\n"
    done
    end_delim=$(printf "${end_delim}}\n")

    start_delim=""
    for i in $(seq 1 7)
    do
        start_delim="$start_delim\\showDayWork{\n"
    done
    start_delim=$(printf "$start_delim")

    echo  "$start_delim"

    for date in $week_dates_holidays
    do
        if grep $date ../holidays.txt > /dev/null 2>&1 ; then
            week_holidays="${week_holidays}1\n"
        else
            week_holidays="${week_holidays}0\n"
        fi

    done

    week_holidays=$(printf "$week_holidays")

    paste -d "" <(echo "$start_delim") <(echo "$week_dates") <(echo "$mid_delim") <(echo "$week_holidays") <(echo "$mid_delim")

    exit
done


# echo "${Refined}"
