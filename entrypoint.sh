#!/bin/sh

if [[ -n "$USERNAME" ]] && [[ -n "$PASSWORD" ]]
then
        htpasswd -bc /etc/nginx/htpasswd $USERNAME $PASSWORD
        echo Done.
else
    echo Using no auth.
        sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/nginx.conf
        sed -i 's%auth_basic_user_file /etc/nginx/htpasswd;% %g' /etc/nginx/nginx.conf
fi

# Start NGINX
echo "Starting NGINX..."
exec nginx -g "daemon off;"
