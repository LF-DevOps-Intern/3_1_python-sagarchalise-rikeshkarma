## This app pulls data from the web using the url provided and saves it into a file using CLI.

1. To initiate virtualenv in python with checking the python, pip and virtualenv version and installing the packages required taking command from the python script has been executed using the [initiate_venv.sh]() file. This task has been completed by using bash.  
           
2. Using the requests package, a CLI application - [cli_app.py]() pulls data from the web with reference to the url provided by the user and saves it to the file.

Sample command to execute the app:
- `bash initiate_venv.sh "https://www.google.com/" true`
  - this command downloads _https://www.google.com/_ page and starts the server
    - `bash initiate_venv.sh "URL" true|false`
- `bash cleanup_venv.sh`
  - this command cleans up the virtualenv created before if the user wants to.

