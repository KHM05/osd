#!/bin/bash

if [ -n "$MYENV" ]; then
    echo "환경변수 확인됨: $MYENV"
else
    echo "환경변수가 없습니다."
fi
