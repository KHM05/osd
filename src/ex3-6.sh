#!/bin/bash

if [ $# -lt 2 ]; then
    echo "사용법: $0 인자1 인자2 ..."
    exit 1
fi

echo "셸 스크립트에서 Python 실행 준비 중..."
python3 my_prog.py "$@"
