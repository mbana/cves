# `CVEs`

## CVEs

* [`./samba/SAMBA`](./samba/SAMBA.md)

## Metasploit

### Docker

```sh
$ docker run --net host --name kali-bleeding-edge -it kalilinux/kali-bleeding-edge bash
apt update -y
apt upgrade -y
apt install -y iproute2 nmap metasploit-framework iputils-ping
apt install -y vim sed wordlists openssh-client zsh
gunzip /usr/share/wordlists/rockyou.txt.gz
mkdir -pv /exploits
cd /exploits
msfconsole
```

### Install in Fedora

You may have noticed we are using the `apt` key in `https://apt.metasploit.com/metasploit-framework.gpg.key` but do not worry, this should work on Fedora.

```sh
sudo rpm --import https://apt.metasploit.com/metasploit-framework.gpg.key
cat <<EOF | sudo tee -a /etc/yum.repos.d/metasploit-framework.repo
[metasploit]
name=Metasploit
baseurl=https://rpm.metasploit.com
gpgcheck=1
gpgkey=https://apt.metasploit.com/metasploit-framework.gpg.key
enabled=1
EOF
sudo dnf install metasploit-framework
```

Then run it via:

```sh
$ /opt/metasploit-framework/bin/msfconsole
```

## References

* <https://github.com/vulhub/vulhub>
