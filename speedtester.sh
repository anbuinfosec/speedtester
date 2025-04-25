#!/bin/bash

DOWNLOAD_URL_100MB="http://ipv4.download.thinkbroadband.com/100MB.zip"
DOWNLOAD_URL_10MB="http://ipv4.download.thinkbroadband.com/10MB.zip"
UPLOAD_TEST_URL="https://httpbin.org/post"
LOG_RESULTS=true
LOG_FILE="$HOME/speedtest.log"
TMP_FILE="/tmp/speedtest_file"
TMP_UPLOAD="/tmp/upload_test_file"
PING_TARGET="8.8.8.8"

function print_title {
    echo ""
    echo "==================== $1 ===================="
}

function check_tools {
    if ! command -v curl &>/dev/null && ! command -v wget &>/dev/null; then
        echo "ERROR: Neither curl nor wget is available. Aborting."
        exit 1
    fi
}

function run_ping_test {
    print_title "Latency Test (Ping)"
    ping -c 4 $PING_TARGET
}

function run_dns_test {
    print_title "DNS Resolution Test"
    { time dig google.com +short; } 2>&1 | grep real
}

function run_download_test {
    print_title "Download Speed Test"
    test_url="$DOWNLOAD_URL_10MB"
    file_size_mb=10
    start=$(date +%s.%N)
    if command -v curl &>/dev/null; then
        curl -o "$TMP_FILE" --silent "$test_url"
    else
        wget -O "$TMP_FILE" --quiet "$test_url"
    fi
    end=$(date +%s.%N)
    elapsed=$(echo "$end - $start" | bc)
    speed_mbps=$(echo "scale=2; $file_size_mb / $elapsed * 8" | bc)
    echo "Downloaded $file_size_mb MB in $elapsed sec"
    echo "Estimated Download Speed: $speed_mbps Mbps"
}

function run_upload_test {
    print_title "Upload Speed Test (Lightweight)"
    dd if=/dev/urandom of="$TMP_UPLOAD" bs=1M count=1 &>/dev/null
    start=$(date +%s.%N)
    curl -o /dev/null -s -w "%{speed_upload}" -X POST -F "file=@$TMP_UPLOAD" "$UPLOAD_TEST_URL" > /tmp/upload_speed
    end=$(date +%s.%N)
    raw_speed=$(cat /tmp/upload_speed)
    raw_speed=${raw_speed%.*}
    upload_mbps=$(echo "scale=2; $raw_speed * 8 / 1000000" | bc)
    echo "Upload Speed: $upload_mbps Mbps"
    rm -f "$TMP_UPLOAD" /tmp/upload_speed
}

function log_results {
    if $LOG_RESULTS; then
        timestamp=$(date "+%Y-%m-%d %H:%M:%S")
        echo "$timestamp - Download: $speed_mbps Mbps, Upload: $upload_mbps Mbps" >> "$LOG_FILE"
    fi
}

clear
echo "⚡ Advanced Internet Speed Test (Pure Bash) ⚡"
echo "Date: $(date)"
echo "---------------------------------------------"

check_tools
run_ping_test
run_dns_test
run_download_test
run_upload_test
log_results

echo "---------------------------------------------"
echo "[+] Test Completed"
rm -f "$TMP_FILE"
