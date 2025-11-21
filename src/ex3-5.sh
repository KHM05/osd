#!/bin/bash

run_ls() {
    cmd="ls $1"
    echo "함수 안에서 실행할 명령어: $cmd"
    eval $cmd
}

echo "프로그램 시작"
run_ls "$*"
echo "프로그램 종료"
