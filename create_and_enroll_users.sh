#!/bin/bash

while IFS="," read username password email name course
do
    echo "Creating user '$username' ($name), password '$password', email: $email and enrolling into $course"
    echo "sudo -u www-data /edx/bin/python.edxapp /edx/app/edxapp/edx-platform/manage.py lms --settings aws create_user -u $username -p $password -e $email -n '$name
'  -c $course"

    sudo -u www-data /edx/bin/python.edxapp /edx/app/edxapp/edx-platform/manage.py lms --settings aws create_user -u $username -p $password -e $email -n "$name" -c $course
done < $1

