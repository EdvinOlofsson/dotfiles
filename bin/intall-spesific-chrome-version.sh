# Get version strings from here: https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
VERSION_STRING="89.0.4389.128-1" # Replace this value with the one you copied earlier
wget "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${VERSION_STRING}_amd64.deb"
sudo dpkg -i "google-chrome-stable_${VERSION_STRING}_amd64.deb"
rm -i "google-chrome-stable_${VERSION_STRING}_amd64.deb"

