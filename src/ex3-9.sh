#!/bin/bash

DB_FILE="DB.txt"

if [ ! -f "$DB_FILE" ]; then
    touch "$DB_FILE"
fi

while true
do
    echo "=========================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색 (날짜)"
    echo "5) 종료"
    echo "=========================="
    echo -n "선택: "
    read choice

    case $choice in
        1)
            echo -n "이름: "
            read name
            echo -n "생일 또는 전화번호: "
            read info
            echo "[정보] 이름: $name, 정보: $info" >> "$DB_FILE"
            echo "등록되었습니다."
            ;;
        2)
            echo -n "날짜 (YYYY-MM-DD): "
            read date
            echo -n "할 일 내용: "
            read todo
            echo "[할일] 날짜: $date, 내용: $todo" >> "$DB_FILE"
            echo "기록되었습니다."
            ;;
        3)
            echo -n "검색할 팀원 이름: "
            read search_name
            echo "--- 검색 결과 ---"
            grep "이름: $search_name" "$DB_FILE"
            if [ $? -ne 0 ]; then
                echo "검색 결과가 없습니다."
            fi
            ;;
        4)
            echo -n "검색할 날짜: "
            read search_date
            echo "--- 검색 결과 ---"
            grep "날짜: $search_date" "$DB_FILE"
            if [ $? -ne 0 ]; then
                echo "검색 결과가 없습니다."
            fi
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
