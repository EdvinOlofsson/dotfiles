# https://www.ubuntuupdates.org/package/google_chrome/stable/main/base/google-chrome-stable
VERSION_STRING='99.0.4844.51-1' # Replace this value with the one you copied earlier from ^
wget "https://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_${VERSION_STRING}_amd64.deb"
sudo dpkg -i "google-chrome-stable_${VERSION_STRING}_amd64.deb"
rm "google-chrome-stable_${VERSION_STRING}_amd64.deb"
