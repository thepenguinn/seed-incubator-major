#!/bin/bash

shopt -s extglob

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

declare -a P1_Week
declare -a P2_Week
declare -a P3_Week
declare -a P4_Week

P1_Cmp_Percent=0
P2_Cmp_Percent=0
P3_Cmp_Percent=0
P4_Cmp_Percent=0

Week_Obj=""
Week_Cmp=""

Week_Data=""

Start_Month_Num=0
End_Month_Num=0

Start_Month=""
End_Month=""

Start_Year=""
End_Year=""

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

    Start_Month_Num="$(date -d "$((24 * $(date "+%w"))) hours ago" "+%m")"
    End_Month_Num="$(date -d "+$((24 * (6 - $(date "+%w")))) hours" "+%m")"

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
            echo -n "/{$Empty_String}" | sed "s/%/\\\%/g"
        else
            echo -n "/{${Anjana[$i]}}" | sed "s/%/\\\%/g"
        fi

        if [[ ${Aswatheertha[$i]} == "@" ]]; then
            echo -n "/{$Empty_String}" | sed "s/%/\\\%/g"
        else
            echo -n "/{${Aswatheertha[$i]}}" | sed "s/%/\\\%/g"
        fi

        if [[ ${Athira[$i]} == "@" ]]; then
            echo -n "/{$Empty_String}" | sed "s/%/\\\%/g"
        else
            echo -n "/{${Athira[$i]}}" | sed "s/%/\\\%/g"
        fi

        if [[ ${Daniel[$i]} == "@" ]]; then
            echo -n "/{$Empty_String}" | sed "s/%/\\\%/g"
        else
            echo -n "/{${Daniel[$i]}}" | sed "s/%/\\\%/g"
        fi

        if [[ $i == $((${#Week_Days[@]} - 1)) ]] ; then
            printf "\n"
        else
            printf ",\n"
        fi

    done

    printf "}\n\n"
}

# array_name obj_str cmp_str percent
add_cmp_status() {

    declare -n arr="$1"
    declare -n per="$4"
    local obj_str="$2"
    local cmp_str="$3"
    local IFS="|"
    local i
    local idx
    local cmp

    IFS="|"
    for i in $obj_str
    do
        i=${i##+([[:space:]])}
        i=${i%%+([[:space:]])}
        [[ ! ${i} =~ .*\.$ ]] && i="${i}."
        arr+=($i)
    done

    IFS=","
    for i in $cmp_str
    do
        i=${i##+([[:space:]])}
        i=${i%%+([[:space:]])}
        idx=${i%-*}
        [[ ! "$idx" == [0-9]* ]] && continue
        idx=$((idx + 0))
        cmp=$(sed "s/^[0-9]*//" <<<"$i")
        [[ "$cmp" == "" ]] && cmp=100 || cmp=${cmp#-}
        [[ ! "$cmp" == [0-9]* ]] && cmp=100
        idx=$((idx - 1))

        if [[ ${arr[$idx]} != "" ]]; then
            arr[$idx]="${arr[$idx]}@$cmp"
        fi
    done

    IFS="$"
    while read i
    do
        if [[ ! ${arr[$i]} =~ @[0-9]* ]]; then
            arr[$i]="${arr[$i]}@0"
        else
            per=$((${arr[$i]#*@} + per))
        fi
    done <<<"$(seq 0 $((${#arr[@]} - 1)))"

    per=$((per / ${#arr[@]}))

}

# cmd_name array
gen_p_cmp_data() {

    local cmd=$1
    declare -n arr=$2
    local str
    local cmp

    unset IFS

    printf "\\\newcommand\\$cmd{\n"

    for i in $(seq 0 $((${#arr[@]} - 1)))
    do
        str=$(sed "s/%/\\\%/g" <<<"${arr[$i]%@*}")
        cmp=${arr[$i]#*@}
        if [[ $cmp -gt 100 ]]; then
            cmp=100
        elif [[ $cmp -lt 0 ]]; then
            cmp=0
        fi
        echo -n "    {$str}/$cmp"

        if [[ $i == $((${#arr[@]} - 1)) ]] ; then
            printf "\n"
        else
            printf ",\n"
        fi
    done

    printf "}\n\n"

}

gen_completion_data() {

    printf "\\def\pOneProgress{$P2_Cmp_Percent}\n"
    printf "\\def\pTwoProgress{$P1_Cmp_Percent}\n"
    printf "\\def\pThreeProgress{$P3_Cmp_Percent}\n"
    printf "\\def\pFourProgress{$P4_Cmp_Percent}\n"

    printf "\n"

    gen_p_cmp_data pOneCmpData P1_Week
    gen_p_cmp_data pTwoCmpData P2_Week
    gen_p_cmp_data pThreeCmpData P3_Week
    gen_p_cmp_data pFourCmpData P4_Week

}

echo "Fetching gsheet..."
if ! gsheet csv --read --id "$Sheet_Id" --range "$Sheet_Range" > tmp.csv ; then
    echo "Failed to fetch gsheet. Exiting..."
fi

Refined=$(replace_comma tmp.csv)

fill_week_data "$Refined"

Week_Dir="$(grep -o "@Week [0-9][0-9]@" <<<"$Week_Data" | tr -d "@" | tr '[:upper:]' '[:lower:]' | tr " " "_")"

mkdir "${Week_Dir}" > /dev/null 2>&1

cp "templete/overview.tex" "${Week_Dir}/"
cp "templete/preamble.tex" "${Week_Dir}/"
cp "templete/weekly.tex" "${Week_Dir}/"
cp "templete/Makefile" "${Week_Dir}/"
cp "templete/completion.tex" "${Week_Dir}/"

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

Week_Obj=$(grep -A 2 "${Week_Dates[6]}-${End_Month_Num}-${End_Year#[0-9][0-9]}" <<<"$Refined" | tail -n 2)
Week_Cmp=$(tail -n 1 <<<"$Week_Obj")
Week_Obj=$(head -n 1 <<<"$Week_Obj")

add_cmp_status P2_Week "$(cut -d"@" -f5 <<<"$Week_Obj")" "$(cut -d"@" -f5 <<<"$Week_Cmp")" P2_Cmp_Percent
add_cmp_status P1_Week "$(cut -d"@" -f4 <<<"$Week_Obj")" "$(cut -d"@" -f4 <<<"$Week_Cmp")" P1_Cmp_Percent
add_cmp_status P3_Week "$(cut -d"@" -f6 <<<"$Week_Obj")" "$(cut -d"@" -f6 <<<"$Week_Cmp")" P3_Cmp_Percent
add_cmp_status P4_Week "$(cut -d"@" -f7 <<<"$Week_Obj")" "$(cut -d"@" -f7 <<<"$Week_Cmp")" P4_Cmp_Percent

gen_completion_data > "${Week_Dir}/completion_data.tex"

cd "${Week_Dir}" && make
cd ../
