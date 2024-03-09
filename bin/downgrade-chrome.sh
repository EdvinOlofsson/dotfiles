# https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
V="${V:-116.0.5845.187-1}" # Replace this value with the one you copied earlier from ^
FILE_NAME="google-chrome-stable_${V}_amd64.deb"
CURRENT_VERSION=$(google-chrome --version | awk '{print $3}')

echo "V: ${V}"
echo "CURRENT_VERSION: ${CURRENT_VERSION}"

if [[ $V = *$CURRENT_VERSION* ]]; then
    echo -e "${V} - Already installed!\n"
    exit 1
fi

if [ -f ./chromes/${FILE_NAME} ]; then
    echo -e "${V} - Local copy exists\n"
else
    echo -e "${V} - No local copy\n"
    wget "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/${FILE_NAME}" -P ./chromes/
fi
echo -e "${V} - Installing...\n"
sudo dpkg -i "./chromes/${FILE_NAME}"
#rm "google-chrome-stable_${V}_amd64.deb"
