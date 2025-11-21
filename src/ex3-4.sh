#!/bin/bash

scores=()

echo "성적 관리 프로그램을 시작합니다."

while true
do
    # 메뉴 출력
    echo "======================"
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급 (GPA) 변환"
    echo "5) 종료"
    echo "======================"

    echo -n "선택: "
    read choice

    case $choice in
        1)
            echo -n "성적을 입력하세요: "
            read score
            # 배열에 점수 추가
            scores+=($score)
            echo "-> $score 점이 추가되었습니다."
            ;;
        2)
            echo "--- 현재 입력된 점수 목록 ---"
            # 배열의 데이터 개수 확인
            if [ ${#scores[@]} -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                # 배열의 모든 원소 출력
                echo "${scores[*]}"
            fi
            ;;
        3)
            # 점수가 없으면 계산 불가
            if [ ${#scores[@]} -eq 0 ]; then
                echo "점수가 없어 평균을 계산할 수 없습니다."
            else
                sum=0
                # 합계 구하기
                for s in "${scores[@]}"; do
                    sum=$(echo "$sum + $s" | bc -l) # 실수 계산 지원
                done

                count=${#scores[@]}
                # 평균 구하기 (소수점 2자리)
                avg=$(echo "$sum / $count" | bc -l | awk '{printf "%.2f", $0}')
                echo "평균 점수: $avg"
            fi
            ;;
        4)
            if [ ${#scores[@]} -eq 0 ]; then
                echo "점수가 없어 등급을 계산할 수 없습니다."
            else
                # 평균 재계산
                sum=0
                for s in "${scores[@]}"; do
                    sum=$(echo "$sum + $s" | bc -l)
                done
                count=${#scores[@]}
                avg=$(echo "$sum / $count" | bc -l)

                # 등급 판정
                is_A=$(echo "$avg >= 90" | bc -l)

                if [ "$is_A" -eq 1 ]; then
                    echo "평균 등급: A"
                else
                    echo "평균 등급: B"
                fi
            fi
            ;;
        5)
            echo "프로그램을 종료합니다."
            break
            ;;
        *)
            echo "잘못된 입력입니다. 1~5 사이의 숫자를 입력해주세요."
            ;;
    esac
    echo ""
done
