#!/bin/bash

if [ $# -lt 2 ]; then
    echo "사용법: $0 점수1 점수2 [점수3 ...]"
    exit 1
fi

echo "--- 성적 처리 시작 ---"

sum=0
count=$#

for score in "$@"
do

    is_A=$(echo "$score >= 90" | bc -l 2>/dev/null || echo "$score" | awk '{if ($1 >= 90) print 1; else print 0}')

    if [ "$is_A" -eq 1 ]; then
        echo "점수: $score => 등급: A"
    else
        echo "점수: $score => 등급: B"
    fi

    sum=$(echo "$sum $score" | awk '{print $1 + $2}')
done

echo "---------------------"

# 평균 점수 계산
avg=$(echo "$sum $count" | awk '{printf "%.2f", $1/$2}')

# 평균 등급 판정
avg_is_A=$(echo "$avg" | awk '{if ($1 >= 90) print 1; else print 0}')

if [ "$avg_is_A" -eq 1 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 점수: $avg"
echo "평균 등급: $avg_grade"
