
echo "This script will clean up some Skype directories ..."
read -rsp $'Press any key to continue...\n' -n 1 key

cd $HOME/Library/Preferences/
rm com.skype.skype.plist
cd ../Application\ Support/
rm -r Skype
