#!/bin/bash

while IFS="," read username password email name course
do
    sudo -u www-data /edx/bin/python.edxapp /edx/app/edxapp/edx-platform/manage.py lms --settings aws create_user -u $username -p $password -e $email -n "$name" -c $course
done < $1

