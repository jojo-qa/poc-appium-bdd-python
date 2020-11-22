#!/bin/bash

# Functions

add_var_to_bashrc() {
  var_name=$1
  if [[ $(cat ~/.profile | grep "export "$1 -c) -eq 0 ]]; then
    echo 'export' $1 >>~/.profile
    echo "$1 added"
  else
    echo $1" already added"
  fi
  source ~/.profile
}

add_var_to_path() {
  var_name=$1
  if [[ $(cat ~/.profile | grep "export PATH+=:"$1 -c) -eq 0 ]]; then
    echo 'export PATH+=:'$1 >>~/.profile
    echo "$1 added to PATH"
  else
    echo $1 "already added to PATH"
  fi
  source ~/.profile
}

# End of functions section

sudo apt-get update && sudo apt-get install -y curl

echo "############ 1 - Installing Android Studio ############"
# 1- Android Studio

FILE=$HOME/Android/Sdk/licenses/android-sdk-license
if [ ! -f "$FILE" ]; then
  echo "$FILE Android studio already installed."
else
  sudo snap install android-studio --classic
fi
echo "Android Studio installed"

echo "############ 2 - Installing JDK and JRE 8 ############"
# 2- Java Open JDK e JRE 8+
yes | sudo apt-get install openjdk-8-jre
yes | sudo apt-get install openjdk-8-jdk

echo "############ 3 - Installing Nodejs ############"
# 3- Node JS
# 3.1 - python3 utils is required to install node at first time
if [ $(which node) ]; then
  echo "Node Already installed"
else
  echo "Installing node"
  yes | sudo apt-get install build-essential
  yes | sudo apt-get install python3-distutils

  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

  nvm install node

  npm install -g n
  n latest
fi

echo "############ Adding Vars to profile and path ############"
add_var_to_bashrc "ANDROID_HOME=$HOME/Android/Sdk"

add_var_to_path "$ANDROID_HOME/bin"
add_var_to_path "$ANDROID_HOME/tools"
add_var_to_path "$ANDROID_HOME/platform-tools"
add_var_to_path "$ANDROID_HOME/lib"
add_var_to_path "$ANDROID_HOME/tools/lib"
add_var_to_path "$ANDROID_HOME/emulator"
add_var_to_bashrc "JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64"
add_var_to_path "$JAVA_HOME"
add_var_to_path "$JAVA_HOME/bin"
add_var_to_path "/usr/local/node/bin"
add_var_to_path "$HOME/android-studio/bin"

yes | sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386

echo "########### Running Android Studio ##################"
echo "########### Please complete Android Studio installation ##################"
echo "########### Close Android Studio afterwards then script will move forward ##################"
studio.sh
echo "############ 4 - Installing Appium  ############"
npm install -g appium
echo "############ 5 - Installing Appium Doctor ############"
npm install -g appium-doctor

appium-doctor --android
