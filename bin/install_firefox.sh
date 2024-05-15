# https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/
V="${V:-123.0}" # Replace this value with the one you copied earlier from ^
LATEST='124.0.2'
FILE_NAME="firefox-mozilla-build_${V}-0ubuntu1_amd64.deb"
CURRENT_VERSION=$(firefox --version | awk '{print $3}')

echo "V: ${V}"
echo "CURRENT_VERSION: ${CURRENT_VERSION}"

if [[ $V = *$CURRENT_VERSION* ]]; then
    echo -e "${V} - Already installed!\n"
    exit 1
fi

if [ -f ./foxes/${FILE_NAME} ]; then
    echo -e "${V} - Local copy exists\n"
else
    echo -e "${V} - No local copy\n"
    wget "sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/${FILE_NAME}" -P ./foxes/

fi
echo -e "${V} - Installing...\n"
sudo dpkg -i "./foxes/${FILE_NAME}"
