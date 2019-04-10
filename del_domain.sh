#!/bin/bash

if [ $# -ne 1 ]
  then
    echo "Usage add_domain <domain name>"
    exit
fi

CERTBOTOUTPUT=$(sudo certbot certificates)

DOMAINS=$(echo "$CERTBOTOUTPUT" | awk -v domain_to_remove=$1 '/Domains: /{$1="";gsub(domain_to_remove,"");gsub(/^ /,"");gsub("  "," ");gsub(/ /,",");print $1}'

CERTNAME=$(echo "$CERTBOTOUTPUT" | awk '/Certificate Name:/{print $3}')

echo "Certificate name: $CERTNAME"
echo "Existing domains: $DOMAINS"
echo "Removing domain: $1"

read -p "Are you sure?" -n 1 -r 
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

  sudo certbot certonly --nginx --cert-name $CERTNAME -d $DOMAINS

fi
