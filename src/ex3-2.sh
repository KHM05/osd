#!/bin/bash

# 인자가 2개 미만이면 사용법 안내
if [ $# -lt 2 ]; then
    echo "사용법: $0 숫자1 숫자2 [숫자3 ...]"
    echo "예시: $0 10 5.5 3"
    exit 1
fi

echo "--- y = 0.5 * x^2 계산 시작 ---"

# 입력된 모든 숫자($@)를 하나씩 꺼내서 x에 넣고 반복
for x in "$@"
do
    # awk를 사용하여 소수점 계산 수행
    # 공식: 0.5 * x * x
    y=$(echo "$x" | awk '{print 0.5 * $1 * $1}')

    echo "x가 $x 일 때, y는 $y 입니다."
done
