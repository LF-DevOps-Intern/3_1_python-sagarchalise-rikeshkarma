#! /bin/bash

# clean the virtual environment according to the user preference
echo "Do you want to wipe out the virtual environment just created? (y/n):"
read -r ans
if [[ $ans == y* ]]; then
  rm -rf ./venv
  echo "virtual environment omitted/ wipped out totally!!"
  printf "\n"
else
  echo "virtual environment previously created untouched!! "
  printf "\n"
fi
