# https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
latest_supported='116.0.5845.187-1'
sudo apt-get update
latest_version=$(apt-cache madison google-chrome-stable | head -n 1 | awk '{print $3}')
CURRENT_VERSION=$(google-chrome --version | awk '{print $3}')
INSTALLING_VERSION="${1:-$latest_version}"
FILE_NAME="google-chrome-stable_${INSTALLING_VERSION}_amd64.deb"

echo "CURRENT_VERSION: ${CURRENT_VERSION}"
echo "INSTALLING_VERSION: ${INSTALLING_VERSION}"

if [[ $INSTALLING_VERSION = *$CURRENT_VERSION* ]]; then
    echo -e "${INSTALLING_VERSION} - Already installed!\n"
    exit 0
fi

if [ -f ./chromes/${FILE_NAME} ]; then
    echo -e "${INSTALLING_VERSION} - Local copy exists\n"
else
    echo -e "${INSTALLING_VERSION} - No local copy\n"
    wget "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/${FILE_NAME}" -P ./chromes/
fi
echo -e "${INSTALLING_VERSION} - Installing...\n"
sudo dpkg -i "./chromes/${FILE_NAME}"
