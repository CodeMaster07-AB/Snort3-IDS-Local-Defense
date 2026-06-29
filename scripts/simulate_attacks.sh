#!/bin/bash
# Security Testing Script - Use only in isolated lab environments

echo "[+] Launching Attack 1: ICMP Flood..."
ping -c 10 -i 0.1 127.0.0.1

echo "[+] Launching Attack 2: Nmap Stealth Port Scan..."
sudo nmap -sS -F 127.0.0.1

echo "[+] Launching Attack 3: Malicious Cleartext Payload Injection..."
curl http://127.0.0.1:8080/classified_compromise
