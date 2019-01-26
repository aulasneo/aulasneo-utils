#!/bin/bash

sudo rabbitmqctl delete_user admin
sudo rabbitmqctl delete_user celery
sudo rabbitmqctl delete_user edx
sudo rabbitmqctl add_user celery `awk '/^EDXAPP_CELERY_PASSWORD/{print $2}' ~/my-passwords.yml | tr -d "'"`
sudo rabbitmqctl add_user edx `awk '/^XQUEUE_RABBITMQ_PASS/{print $2}' ~/my-passwords.yml | tr -d "'"`
sudo rabbitmqctl add_user admin `awk '/^RABBIT_ADMIN_PASSWORD/{print $2}' ~/my-passwords.yml | tr -d "'"`
sudo rabbitmqctl set_permissions -p "/" celery ".*" ".*" ".*"
sudo rabbitmqctl set_permissions -p "/" edx ".*" ".*" ".*"
sudo rabbitmqctl set_permissions -p "/" admin ".*" ".*" ".*"
sudo service rabbitmq-server restart

