# !/usr/bin/env python3

import argparse
import requests
import subprocess

# handling parsers
parser = argparse.ArgumentParser()
parser.add_argument('--url', action='store', type=str)  # add url
parser.add_argument('--http_server', action='store_true')  # add http_server
args = parser.parse_args()  # save arguments

# google.com or .png, .txt
filename = args.url.split('/')[-1] or 'index.html'

response = requests.get(args.url)  # request data from url

content = response.content

with open(filename, 'wb') as file:
    # saving the file from the url
    file.write(content)

runserver_command = "python3 -m http.server"

# run http sever if argument is true
if args.http_server:
    proc = subprocess.Popen(runserver_command, shell=True)
    proc.wait()

    if proc.returncode == 0:  # return 0 is command is executed successfully
        print('\nthe server has been invoked\n')
    else:
        print('\nerror starting the server\n')
