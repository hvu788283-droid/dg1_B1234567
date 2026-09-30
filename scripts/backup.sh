#!/bin/bash

if [ -z "$1" ]; then
    echo "Lỗi: Chưa truyền tham số thư mục cần sao lưu!"
    exit 1
fi

TARGET_DIR="$1"

if [ ! -d "$TARGET_DIR" ]; then
    echo "Lỗi: Thư mục '$TARGET_DIR' không tồn tại!"
    exit 2
fi

mkdir -p ~/backup

DIR_NAME=$(basename "$TARGET_DIR")
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$HOME/backup/${DIR_NAME}_${TIMESTAMP}.tar.gz"

tar -czf "$BACKUP_FILE" -C "$(dirname "$TARGET_DIR")" "$DIR_NAME"

LOG_FILE="/mnt/c/Users/Admin/dg1_B1234567/logs/backup.log"
mkdir -p "$(dirname "$LOG_FILE")"
echo "$(date '+%Y-%m-%d %H:%M:%S') - $BACKUP_FILE" >> "$LOG_FILE"

echo "Sao lưu thành công! Tệp đích: $BACKUP_FILE"
