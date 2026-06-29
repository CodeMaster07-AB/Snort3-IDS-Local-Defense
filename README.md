# Snort3-IDS-Local-Defense
# Snort 3 Intrusion Detection System (IDS) Deployed Environment

## Project Overview
This repository contains the configuration profiles, custom rule signatures, and verification telemetry for an enterprise-grade **Snort 3 (Snort++)** Intrusion Detection System lab deployment. The objective of this capstone is to establish real-time host-level monitoring, analyze network-layer traffic baselines, and engineer high-fidelity signatures capable of detecting multi-vector tactical threats.

## Environment & Tools
* **Defense Engine:** Snort++ v3.12.2.0 (Configured via programmatic Lua)
* **Host Environment:** Kali Linux (Isolated Virtual Machine)
* **Analysis Engine:** Wireshark Packet Analyzer
* **Threat Vectors:** ICMP Flood, Nmap Stealth TCP Port Scanning, Application-Layer Payload Injection

---

## Repository Contents
* `/rules/local.rules`: Custom rule headers and options engineered for multi-layer inspection.
* `/assets/`: Live validation snapshots proving runtime alerting and logging metrics.
* `/scripts/`: Automated execution scripts mapping simulated attack profiles.

---

## Engineered Signature Architectures

The file `rules/local.rules` implements custom detection blocks mapping distinct Snort Identifiers (`sid`):

```snort
# Network Layer Rate Limiting Filter
alert icmp any any -> any any (msg:"ICMP Ping Burst Detected"; detection_filter:track by_src, count 5, seconds 2; sid:1000001; rev:1;)

# Transport Layer Flag Dissection
alert tcp any any -> any any (msg:"Nmap TCP Port Scan Detected"; flags:S; sid:1000002; rev:1;)

# Application Layer Deep Packet Inspection
alert tcp any any -> any any (msg:"Suspicious Trigger String Found in Payload"; content:"classified_compromise"; sid:1000003; rev:1;)
