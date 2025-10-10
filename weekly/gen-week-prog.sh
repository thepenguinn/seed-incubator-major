#!/bin/bash

Sheet_Id="1BGm3614htXhX2BDocnOUPSdyQIvPXxcwbZQEq4nDHJU"
Sheet_Range="Sheet1"

Empty_String="Haven't done anything."

Week_Dir=""

Refined=""

declare -a Anjana
declare -a Aswatheertha
declare -a Athira
declare -a Daniel

declare -a Week_Dates
declare -a Week_Days=( "SUN" "MON" "TUE" "WED" "THU" "FRI" "SAT" )
declare -a Week_Holidays=( 1 0 0 0 0 0 0 )

Week_Data=""

echo "Fetching gsheet..."
if ! gsheet csv --read --id "$Sheet_Id" --range "$Sheet_Range" > tmp.csv ; then
    echo "Failed to fetch gsheet. Exiting..."
fi

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

# $1 -> refined csv data
fill_week_data() {

    local i
    local date_string
    local tmp

    for i in $(seq 0 $(date "+%w") | sort -r)
    do
        date_string="@$(date -d "$((24 * $i)) hours ago" "+%d-%m-%g")"
        Week_Dates+=("$(date -d "$((24 * $i)) hours ago" "+%d")")
        tmp=$(grep "$date_string" <<<"$1")
        if [[ "$tmp" == "" ]]; then
            echo "Couldn't find data for $date_string from the csv file. This shouldn't have happened. Exiting..."
            exit 1
        fi
        Week_Data="$Week_Data$tmp\n"
    done

    for i in $(seq $(($(date "+%w") + 1)) 6 | sort -r)
    do
        date_string="@$(date -d "+$((24 * (7 - $i))) hours" "+%d-%m-%g")"
        Week_Dates+=("$(date -d "+$((24 * (7 - $i))) hours" "+%d")")
        tmp=$(grep "$date_string" <<<"$1")
        if [[ "$tmp" == "" ]]; then
            echo "Couldn't find data for $date_string from the csv file. This shouldn't have happened. Exiting..."
            exit 1
        fi
        Week_Data="$Week_Data$tmp\n"
    done

    Week_Data=$(printf "${Week_Data}")

}

gen_gsheet_data() {

    local i

    printf "\\def\\week{$(tr '[:lower:]' '[:upper:]' <<<"$Week_Dir" | tr "_" " ")}\n"

    Start_Month="$(date -d "$((24 * $(date "+%w"))) hours ago" "+%b" | tr '[:lower:]' '[:upper:]')"
    End_Month="$(date -d "+$((24 * (6 - $(date "+%w")))) hours" "+%b" | tr '[:lower:]' '[:upper:]')"

    Start_Year="$(date -d "$((24 * $(date "+%w"))) hours ago" "+%G")"
    End_Year="$(date -d "+$((24 * (6 - $(date "+%w")))) hours" "+%G")"

    printf "\\def\\weekRange{${Start_Month} ${Week_Dates[0]} ${Start_Year} -- ${End_Month} ${Week_Dates[6]} ${End_Year}}\n\n"

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

Refined=$(replace_comma tmp.csv)

fill_week_data "$Refined"

Week_Dir="$(grep -o "@Week [0-9][0-9]@" <<<"$Week_Data" | tr -d "@" | tr '[:upper:]' '[:lower:]' | tr " " "_")"

mkdir "${Week_Dir}" > /dev/null 2>&1

cp "templete/overview.tex" "${Week_Dir}/"
cp "templete/preamble.tex" "${Week_Dir}/"
cp "templete/weekly.tex" "${Week_Dir}/"
cp "templete/Makefile" "${Week_Dir}/"

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

gen_gsheet_data > "${Week_Dir}/gsheet_data.tex"

cp tmp.csv "${Week_Dir}/gsheet.csv"

cd "${Week_Dir}" && make
cd ../
