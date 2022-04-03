#! /bin/sh

cd backend
#pip3 install -r requirements.txt # run this command to install the package requirements
python3 manage.py makemigrations
python3 manage.py migrate
#python3 manage.py migrate --run-syncdb # run this command to generate the database
python3 manage.py runserver
