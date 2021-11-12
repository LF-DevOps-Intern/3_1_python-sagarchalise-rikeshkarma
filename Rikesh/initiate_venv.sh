#! /bin/bash

ARGS=2
if [ $# -ne "$ARGS" ]; then
  echo "No arguments provided"
  echo "usage: $0 url [true|false]"
  exit 1
fi

# checking python3 on the system
function check_python() {
  python3 --version
}

# checking pip on the system
function check_pip() {
  pip3 --version
}

# checking venv on the system
function check_venv() {
  virtualenv --version
}

# install python3 if not available on the system
if ! check_python; then
  echo "python3 not installed on your system"
  echo "installing python3...."
  sudo apt install -y python3
  echo "python3 installed"
  printf "\n"
else
  echo "Already installed on the system"
  printf "\n"
fi

# install pip3 if not available on the system
if ! check_pip; then
  echo "pip3 not installed on your system"
  echo "installing pip3...."
  sudo apt install -y python3-pip
  echo "pip3 installed"
  printf "\n"
else
  echo "Already installed on the system"
  printf "\n"
fi

# install venv if not available on the system
if ! check_venv; then
  echo "virtual environment is not installed on your system"
  echo "installing venv...."
  pip3 install virtualenv
  echo "virtual environment installed"
  printf "\n"
else
  echo "Already installed on the system"
  printf "\n"
fi

# initiate a virtual environment as venv
virtualenv venv
echo "virtual environment initiated!!"
printf "\n"

# activate the virtual environment 'venv' we just created
echo "activating the virtual environment..."
source ./venv/bin/activate
echo "virtual environment activated!!"
printf "\n"

# installing the required dependencies from requirement.txt file
echo "installing the dependencies required..."
pip3 install -r ./requirements.txt
echo "required dependencies installed!!"
printf "\n"

URL=$1
SERVER_FLAG=$2

if [[ "$SERVER_FLAG" == "true" ]]; then
  printf "saving the file from the url and starting the server in a moment..."
  printf "\n"
  python3 cli_app.py --url="$URL" --http_server
else
  printf "saving the file from the url only...."
  printf "\n"
  python3 cli_app.py --url="$URL"
fi
