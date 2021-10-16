Add ADB to PATH on OSX


https://medium.com/macoclock/add-adb-to-path-on-osx-8bc2f11a19ea

paste following line in .zshrc (for catalina) & .bashrc (below catalina)
export PATH=$PATH:/Users/username/Library/Android/sdk/platform-tools/

Restart by
source .zshrc

Restart android studio
check by
adb version
adb devices
