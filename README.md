Appium Android Simple Test for Behave (BDD)
========================================

BDD framework used is Behave which is an Cucumber clone for Python.
 
Mobile Test Automation framework is Appium which is most supported right now.

More about Appium tests setup here: 
Install Behave and Appium:

```shell
pip install appium-python-client
pip install behave
```
Usage: 

You may limit the test cases using tags
```shell
behave --tags=current android.feature
```
This is a way run appium tests in your Ubuntu based SO.

Steps to install Appium

Install dependencies required by Appium
Run the below command on your Terminal
```shell
sudo apt-get install build-essential \
curl git m4 ruby texinfo libbz2-dev \
libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
```

Install linuxbrew
Linuxbrew is required to install Node and we need node to install Appium

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
You should see this message on your Terminal
```


Export path variables
# Add this to end of bashrc
vim ~/.bashrc

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"

# Source bashrc
source ~.bashrc
Install gcc
Installing GCC is recommended by linuxbrew

brew install gcc
Install node
brew update
brew install node
brew link node
 
Install Appium:
npm install -g appium
npm install wd
 
Start Appium
Run the command on your Terminal

$ appium
Screenshot from 2018-04-18 21:17:41

Install Appium doctor
Appium doctor is very useful to check the configs required for Appium. Install it be this command:

npm install appium-doctor -g
$ appium-doctor
Set path variables for ANDROID_HOME and JAVA_HOME
Set the important env variables in the bashrc file

export ANDROID_HOME=~/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$JAVA_HOME/bin

source ~/.bashrc
Install Appium Python client

We will use python for our Appium tests so we need to install Appium-Python-Client on our box. Use this command to install. You can skip this step if you’re using Java for your Appium tests:

