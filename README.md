# 🌐 **Advanced Bash Internet Speed Test** ⚡

[![GitHub](https://img.shields.io/github/repo-size/anbuinfosec/speedtester)](https://github.com/anbuinfosec/speedtester)
[![MIT License](https://img.shields.io/badge/license-MIT-blue)](https://opensource.org/licenses/MIT)

A **high-quality, pure Bash script** that tests your **download speed**, **upload speed**, **latency**, and **DNS resolution time** — without the need for external packages or modules. This is all done using built-in tools like `ping`, `curl`, and `wget`.

---

## 🚀 **Quick Start**

### 🔗 **Execute the Script Directly from GitHub**

You can **download and execute** the script directly from the **GitHub raw URL** using `curl` or `wget`. 

```bash
curl -sSL https://raw.githubusercontent.com/anbuinfosec/speedtester/main/speedtester.sh | bash
```

Or if you prefer using `wget`:

```bash
wget -qO- https://raw.githubusercontent.com/anbuinfosec/speedtester/main/speedtester.sh | bash
```

### 📋 **Steps to Run Manually:**

1. **Download the script**:
    ```bash
    curl -O https://raw.githubusercontent.com/anbuinfosec/speedtester/main/speedtester.sh
    ```

2. **Make it executable**:
    ```bash
    chmod +x speedtester.sh
    ```

3. **Run the script**:
    ```bash
    ./speedtester.sh
    ```

---

## 🛠️ **Features**

- **🌍 Ping Test**: Measures latency to `8.8.8.8` (Google DNS).
- **💻 DNS Resolution Test**: Measures the time to resolve `google.com`.
- **⚡ Download Speed**: Tests download speed from a reliable server.
- **📤 Upload Speed**: Measures upload speed using a public echo service.
- **📝 Logs Results**: Optionally logs results with a timestamp.

---

## 🎨 **Example Output**

```bash
⚡ Advanced Internet Speed Test (Pure Bash) ⚡
Date: Thu Apr 25 2025
---------------------------------------------

==================== Latency Test (Ping) ===================
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=56 time=12.4 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=56 time=11.8 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=56 time=12.0 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=56 time=12.2 ms

--- 8.8.8.8 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3002ms
rtt min/avg/max/mdev = 11.840/12.085/12.427/0.222 ms

==================== DNS Resolution Test ===================
real    0m0.428s

==================== Download Speed Test ===================
Downloaded 10 MB in 1.22 sec
Estimated Download Speed: 66.12 Mbps

==================== Upload Speed Test (Lightweight) ===================
Upload Speed: 3.02 Mbps

---------------------------------------------
[+] Test Completed
```

---

## 📝 **Logging Results**

You can choose to **log results** to a file (default: `$HOME/speedtester.log`) with each test. The log file will have a timestamp and the results for download and upload speeds.

Example log entry:

```
2025-04-25 13:45:10 - Download: 66.12 Mbps, Upload: 3.02 Mbps
```

---

## 🧑‍💻 **Customization**

You can edit the script to:

- Change the **download file size**.
- Toggle **logging** with `LOG_RESULTS=true/false`.
- Modify **upload test** URL for different file size or server.

---


## 🤝 **Contributing**

Feel free to contribute to the project! To get started:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add feature'`).
4. Push to your branch (`git push origin feature-name`).
5. Create a new Pull Request.

---

## 🧑‍💻 **Author**

👤 **anbuinfosec**  
GitHub: [https://github.com/anbuinfosec](https://github.com/anbuinfosec)

---
