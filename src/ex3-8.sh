#!/bin/bash

if [ ! -d "DB" ]; then
    echo "DB 폴더가 없으므로 생성합니다."
    mkdir DB
else
    echo "DB 폴더가 이미 존재합니다."
fi

cd DB
for i in {1..5}
do
    touch "data_file_$i.txt"
done
cd ..

echo "DB 폴더 내 파일 생성 완료."

tar -czf DB_files.tar.gz DB/
echo "DB 폴더 압축 완료 (DB_files.tar.gz)"

if [ ! -d "train" ]; then
    mkdir train
    echo "train 폴더 생성 완료."
fi

cwd=$(pwd)
for i in {1..5}
do
    ln -s "$cwd/DB/data_file_$i.txt" "train/linked_file_$i.txt"
done

echo "train 폴더에 심볼릭 링크 생성 완료."

echo "========================================"
echo "1. DB 폴더 내부 확인"
ls -l DB/
echo ""
echo "2. 압축 파일 확인"
ls -l DB_files.tar.gz
echo ""
echo "3. train 폴더 (링크) 확인"
ls -l train/
echo "========================================"
