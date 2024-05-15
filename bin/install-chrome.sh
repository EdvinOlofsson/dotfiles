#!/bin/bash

# https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
# Update package lists
sudo apt update >/dev/null

# Get the latest package version information
latest_version=$(apt-cache madison google-chrome-stable | head -n 1 | awk '{print $3}' | sed 's/-1$//')

# Set the version to install to either the first argument or the latest version
V="${1:-$latest_version}"

# Get the currently installed version of Google Chrome
CURRENT_VERSION=$(google-chrome --version 2>/dev/null | awk '{print $3}')

echo "Latest Version : ${latest_version}"
echo "Desired Version: ${V}"
echo "Current Version: ${CURRENT_VERSION}"

# Check if the desired version is already installed
if [[ $V = $CURRENT_VERSION ]]; then
  echo -e "${V} - Already installed!\n"
  exit 0
fi

# Check if the desired version is available in the repository
if apt-cache madison google-chrome-stable | awk '{print $3}' | grep -q "^$V$"; then
  echo -e "${V} - Available in repository\n"
else
  echo -e "${V} - Not found in repository\n"
  #exit 1
fi

# Install the specified version of Google Chrome
echo -e "${V} - Installing...\n"
sudo apt install -y --allow-downgrades google-chrome-stable=$V

CURRENT_VERSION=$(google-chrome --version 2>/dev/null | awk '{print $3}' | sed 's/-1$//')
echo "Current Version: ${CURRENT_VERSION}"

# Verify installation
if [[ "$V" == *$(google-chrome --version | awk '{print $3}') ]]; then
  echo -e "${V} - Installation successful\n"
else
  echo -e "${V} - Installation failed\n"
fi
