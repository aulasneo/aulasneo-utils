#!/bin/bash

while IFS="," read username password email name course
do
    echo "Creating user '$username' ($name), password '$password', email: $email"
    echo "sudo -u www-data /edx/bin/python.edxapp /edx/app/edxapp/edx-platform/manage.py lms --settings aws create_user -u $username -p $password -e $email -n '$name'"
    sudo -u www-data /edx/bin/python.edxapp /edx/app/edxapp/edx-platform/manage.py lms --settings aws create_user -u $username -p $password -e $email -n "$name"
done < $1

