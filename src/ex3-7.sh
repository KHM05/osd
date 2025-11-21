#!/bin/bash

while true
do
    echo "=============================="
    echo "1) 사용자 정보 확인"
    echo "2) CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "=============================="
    echo -n "선택: "
    read choice

    case $choice in
        1)
            echo "--- 현재 접속 중인 사용자 정보 ---"
            who
            echo "--- 현재 사용자 ID 정보 ---"
            id
            ;;
        2)
            echo "--- CPU 사용률 (top) ---"
            top -b -n 1 | head -n 5
            ;;
        3)
            echo "--- 메모리 사용량 (free) ---"
            free -h
            ;;
        4)
            echo "--- 디스크 사용량 (df) ---"
            df -h
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "잘못된 입력입니다."
            ;;
    esac
    echo ""
done
