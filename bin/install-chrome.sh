#!/bin/bash

#https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
wdio_version='116.0.5845.187-1'

# Ensure the chromes directory exists
mkdir -p ./chromes/

# Get the system architecture dynamically
ARCH=$(dpkg --print-architecture)

# Update apt package lists
sudo apt-get update

# Get the latest available version from apt-cache
latest_version=$(apt-cache policy google-chrome-stable | grep Candidate | awk '{print $2}')
if [ -z "$latest_version" ]; then
    echo "Error: Could not determine latest Chrome version from apt-cache."
    exit 1
fi

# Get the currently installed version
CURRENT_VERSION=""
if command -v google-chrome &> /dev/null; then
    CURRENT_VERSION=$(google-chrome --version | awk '{print $3}')
fi

# Determine the version to install (from argument or latest_version)
INSTALLING_VERSION="${1:-$latest_version}"
if [ -z "$INSTALLING_VERSION" ]; then
    echo "Error: No version specified for installation."
    exit 1
fi

FILE_NAME="google-chrome-stable_${INSTALLING_VERSION}_${ARCH}.deb"

echo "CURRENT_VERSION: ${CURRENT_VERSION}"
echo "INSTALLING_VERSION: ${INSTALLING_VERSION}"
echo "Target File: ${FILE_NAME}"

# Proper version comparison
if [[ "$INSTALLING_VERSION" == "$CURRENT_VERSION" ]]; then
    echo -e "${INSTALLING_VERSION} - Already installed and is the target version!\n"
    exit 0
fi

# Check if the .deb file already exists locally
if [ -f "./chromes/${FILE_NAME}" ]; then
    echo -e "${INSTALLING_VERSION} - Local copy exists\n"
else
    echo -e "${INSTALLING_VERSION} - No local copy, downloading...\n"
    # Use -f for curl to fail silently on HTTP errors, and check exit status
    if ! curl -f -o "./chromes/${FILE_NAME}" "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/${FILE_NAME}"; then
        echo "Error: Download failed for ${FILE_NAME}."
        exit 1
    fi
fi

echo -e "${INSTALLING_VERSION} - Installing...\n"
# Use apt install for better dependency handling
sudo apt install "./chromes/${FILE_NAME}"

echo -e "${INSTALLING_VERSION} - Installation complete.\n"
