#!/bin/bash

Sheet_Id="1BGm3614htXhX2BDocnOUPSdyQIvPXxcwbZQEq4nDHJU"
Sheet_Range="Sheet1"

Empty_String="Haven't done anything."

# echo "Fetching gsheet..."
# gsheet csv --read --id "$Sheet_Id" --range "$Sheet_Range" > tmp.csv

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
        printf "$refined\n"@ | sed 's/@$//'

    done < $1
}

Refined=$(replace_comma tmp.csv)

declare -a Anjana
declare -a Aswatheertha
declare -a Athira
declare -a Daniel

declare -a Week_Dates
declare -a Week_Days=( "SUN" "MON" "TUE" "WED" "THU" "FRI" "SAT" )
declare -a Week_Holidays=( 1 0 0 0 0 0 0 )

Week_Data=""

# $1 -> refined csv data
fill_week_data() {

    local i
    local date_string

    for i in $(seq 0 $(date "+%w") | sort -r)
    do
        date_string="@$(date -d "$((24 * $i)) hours ago" "+%d-%m-%g")"
        Week_Dates+=("$(date -d "$((24 * $i)) hours ago" "+%d")")
        Week_Data="$Week_Data$(grep "$date_string" <<<"$1")\n"
    done

    for i in $(seq $(($(date "+%w") + 1)) 6 | sort -r)
    do
        date_string="@$(date -d "+$((24 * (7 - $i))) hours" "+%d-%m-%g")"
        Week_Dates+=("$(date -d "+$((24 * (7 - $i))) hours" "+%d")")
        Week_Data="$Week_Data$(grep "$date_string" <<<"$1")\n"
    done

    Week_Data=$(printf "${Week_Data}")

}

fill_week_data "$Refined"

while read line
do
    Anjana+=("$line")
done <<<"$(cut -d"@" -f4 <<<"$Week_Data" | sed s/^$/@/g)"

while read line
do
    Aswatheertha+=("$line")
done <<<"$(cut -d"@" -f5 <<<"$Week_Data" | sed s/^$/@/g)"

while read line
do
    Athira+=("$line")
done <<<"$(cut -d"@" -f6 <<<"$Week_Data" | sed s/^$/@/g)"

while read line
do
    Daniel+=("$line")
done <<<"$(cut -d"@" -f7 <<<"$Week_Data" | sed s/^$/@/g)"

gen_gsheet_data() {

    printf "\\def\\week{$(grep -o "@Week [0-9][0-9]@" <<<"$Week_Data" | tr -d "@" | tr '[:lower:]' '[:upper:]')}\n"

    Start_Month="$(date -d "$((24 * $(date "+%w"))) hours ago" "+%b" | tr '[:lower:]' '[:upper:]')"
    End_Month="$(date -d "+$((24 * (6 - $(date "+%w")))) hours" "+%b" | tr '[:lower:]' '[:upper:]')"

    printf "\\def\\weekRange{${Start_Month} ${Week_Dates[0]} -- ${End_Month} ${Week_Dates[6]}}\n\n"

    printf "\\\newcommand\\calData {\n"

    for i in $(seq 0 $((${#Week_Days[@]} - 1)))
    do
        printf "    ${Week_Dates[$i]}/${Week_Days[$i]}/${Week_Holidays[$i]}"

        if [[ ${Anjana[$i]} == "@" ]]; then
            printf "/0"
        else
            printf "/1"
        fi

        if [[ ${Aswatheertha[$i]} == "@" ]]; then
            printf "/0"
        else
            printf "/1"
        fi

        if [[ ${Athira[$i]} == "@" ]]; then
            printf "/0"
        else
            printf "/1"
        fi

        if [[ ${Daniel[$i]} == "@" ]]; then
            printf "/0"
        else
            printf "/1"
        fi

        if [[ $i == $((${#Week_Days[@]} - 1)) ]] ; then
            printf "\n"
        else
            printf ",\n"
        fi
    done

    printf "}\n\n"

    printf "\\\newcommand\\\tblData {\n"

    for i in $(seq 0 $((${#Week_Dates[@]} - 1)))
    do
        printf "    ${Week_Dates[$i]}/${Week_Holidays[$i]}"

        if [[ ${Anjana[$i]} == "@" ]]; then
            printf "/$Empty_String"
        else
            printf "/${Anjana[$i]}"
        fi

        if [[ ${Aswatheertha[$i]} == "@" ]]; then
            printf "/$Empty_String"
        else
            printf "/${Aswatheertha[$i]}"
        fi

        if [[ ${Athira[$i]} == "@" ]]; then
            printf "/$Empty_String"
        else
            printf "/${Athira[$i]}"
        fi

        if [[ ${Daniel[$i]} == "@" ]]; then
            printf "/$Empty_String"
        else
            printf "/${Daniel[$i]}"
        fi

        if [[ $i == $((${#Week_Days[@]} - 1)) ]] ; then
            printf "\n"
        else
            printf ",\n"
        fi

    done

    printf "}\n\n"
}

gen_gsheet_data > gsheet_data.tex
