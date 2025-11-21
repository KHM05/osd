#!/bin/bash

if [ $# -ne 2 ]; then
    echo "사용법: $0 숫자1 숫자2"
    exit 1
fi

num1=$1
num2=$2

echo "입력된 숫자: $num1, $num2"

# 1. 덧셈
add=$((num1 + num2))
echo "$num1 + $num2 = $add"

# 2. 뺄셈
sub=$((num1 - num2))
echo "$num1 - $num2 = $sub"

# 3. 곱셈
mul=$((num1 * num2))
echo "$num1 * $num2 = $mul"

# 4. 나눗셈
if [ "$num2" -eq 0 ]; then
    echo "$num1 / $num2 = 계산 불가 (0으로 나눔)"
else
    div=$((num1 / num2))
    echo "$num1 / $num2 = $div"
fi
