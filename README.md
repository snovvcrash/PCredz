# PCredz

:exclamation: **Changes in this fork:** added a Dockerfile due to the [Cython bug with Python 3.10](https://stackoverflow.com/a/70454853/6253579).

Run the container as follows (logs are saved to `~/.pcredz`):

```console
~$ alias pcredz='docker run --rm -it --network host -v ~/.pcredz:/root/.pcredz snovvcrash/pcredz'
~$ pcredz
```

[![dockeri.co](https://dockeri.co/image/snovvcrash/pcredz)](https://hub.docker.com/r/snovvcrash/pcredz)

---

This tool extracts Credit card numbers, NTLM(DCE-RPC, HTTP, SQL, LDAP, etc), Kerberos (AS-REQ Pre-Auth etype 23), HTTP Basic, SNMP, POP, SMTP, FTP, IMAP, etc from a pcap file or from a live interface.

## Features

- Extract from a pcap file or from a live interface IPv4 and IPv6:
  - Credit card numbers
  - POP
  - SMTP
  - IMAP
  - SNMP community string
  - FTP
  - HTTP (NTLM/Basic/HTTP Forms)
  - NTLMv1/v2 (DCE-RPC,SMBv1/2,LDAP, MSSQL, HTTP, etc)
  - Kerberos (AS-REQ Pre-Auth etype 23) hashes.

- All hashes are displayed in a hashcat format (use -m 7500 for kerberos, -m 5500 for NTLMv1, -m 5600 for NTLMv2).
- Log all credentials and information to a file (CredentialDump-Session.log).
- Log credentials in the logs/ folder. MSKerb.txt, NTLMv1.txt and NTLMv2.txt can be directly fed to hashcat. 

## Install

### Linux

On a debian based OS bash:

```bash
apt install python3-pip && sudo apt-get install libpcap-dev && pip3 install Cython && pip3 install python-libpcap
```

## Usage
 
 ```
 # extract credentials from a pcap file
python3 ./Pcredz -f file-to-parse.pcap

# extract credentials from all pcap files in a folder
python3 ./Pcredz -d /tmp/pcap-directory-to-parse/

# extract credentials from a live packet capture on a network interface (need root privileges)
python3 ./Pcredz -i eth0 -v
```

### Options

```bash
  -h, --help          show this help message and exit
  -f capture.pcap     Pcap file to parse
  -d /home/pnt/pcap/  Pcap directory to parse recursivly
  -i eth0             interface for live capture
  -v                  More verbose.
```
