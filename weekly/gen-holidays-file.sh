#!/bin/bash

declare -a Years

Years=( 2025 2026 )

gen_second_saturdays() {

    local year
    local month
    local day

    for year in ${Years[@]}
    do
        for month in $(seq 1 12)
        do
            day=$(cal $month $year -v | tail -n 1 | awk '{print $3}')

            # year-month-day
            printf "%04d-%02d-%02d\n" $year $month $day

        done
    done
}

gen_other_holidays() {
    python ./gen_other_holidays.py ${Years[@]}
}

gen_sundays() {

    local year
    local month
    local days
    local day

    for year in ${Years[@]}
    do
        for month in $(seq 1 12)
        do
            days=$(cal $month $year -v | head -n 2 | tail -n 1 | sed "s/Su *//")

            for day in $days
            do
                # year-month-day
                printf "%04d-%02d-%02d\n" $year $month $day
            done

        done
    done
}

gen_holidays() {
    gen_second_saturdays
    gen_sundays
    gen_other_holidays
}

gen_holidays | sort | uniq | awk -F "-" '{print $3 "-" $2 "-" $1}' > holidays.txt
