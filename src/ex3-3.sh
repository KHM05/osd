#!/bin/bash

# 인자가 2개 미만이면 사용법 안내
if [ $# -lt 2 ]; then
    echo "사용법: $0 점수1 점수2 [점수3 ...]"
    exit 1
fi

echo "--- 성적 처리 시작 ---"

# 합계 변수 초기화
sum=0
# 과목 수(입력된 인자의 개수)
count=$#

# 1. 각 과목별 등급 출력 (반복문)
for score in "$@"
do
    # 90점 이상인지 확인 (실수 비교를 위해 awk 사용)
    # 1이면 참(True), 0이면 거짓(False)
    is_A=$(echo "$score >= 90" | bc -l 2>/dev/null || echo "$score" | awk '{if ($1 >= 90) print 1; else print 0}')

    if [ "$is_A" -eq 1 ]; then
        echo "점수: $score => 등급: A"
    else
        echo "점수: $score => 등급: B"
    fi

    # 합계 누적 (awk 사용)
    sum=$(echo "$sum $score" | awk '{print $1 + $2}')
done

echo "---------------------"

# 2. 평균 점수 계산 (소수점 2자리까지 표시)
avg=$(echo "$sum $count" | awk '{printf "%.2f", $1/$2}')

# 3. 평균 등급 판정
avg_is_A=$(echo "$avg" | awk '{if ($1 >= 90) print 1; else print 0}')

if [ "$avg_is_A" -eq 1 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo "평균 점수: $avg"
echo "평균 등급: $avg_grade"
