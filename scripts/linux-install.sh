#!/usr/bin/env bash
set -euo pipefail

if [ -f /etc/debian_version ]; then
  echo "Installing osquery (Debian/Ubuntu)..."
  sudo apt-get update -y
  sudo apt-get install -y gnupg lsb-release curl
  KEYRING=/usr/share/keyrings/osquery-archive-keyring.gpg
  curl -fsSL https://pkg.osquery.io/deb/pubkey.gpg | sudo gpg --dearmor -o "$KEYRING"
  echo "deb [signed-by=$KEYRING] https://pkg.osquery.io/deb deb main" | sudo tee /etc/apt/sources.list.d/osquery.list
  sudo apt-get update -y
  sudo apt-get install -y osquery
elif [ -f /etc/redhat-release ]; then
  echo "Installing osquery (RHEL/CentOS/Fedora)..."
  sudo rpm --import https://pkg.osquery.io/rpm/GPG
  sudo tee /etc/yum.repos.d/osquery.repo >/dev/null <<'EOF'
[osquery]
name=osquery RPM repository
baseurl=https://pkg.osquery.io/rpm/$basearch
enabled=1
gpgcheck=1
gpgkey=https://pkg.osquery.io/rpm/GPG
EOF
  sudo yum install -y osquery
else
  echo "Unsupported distro. Install manually from https://osquery.io/downloads"
  exit 1
fi

echo "osquery installed. Try: osqueryi --help"
