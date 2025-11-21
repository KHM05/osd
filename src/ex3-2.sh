#!/bin/bash

if [ $# -lt 2 ]; then
    echo "사용법: $0 숫자1 숫자2 [숫자3 ...]"
    echo "예시: $0 10 5.5 3"
    exit 1
fi

echo "--- y = 0.5 * x^2 계산 시작 ---"

for x in "$@"
do

    y=$(echo "$x" | awk '{print 0.5 * $1 * $1}')

    echo "x가 $x 일 때, y는 $y 입니다."
done
