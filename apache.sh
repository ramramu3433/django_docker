#!/bin/bash

echo "
WSGIScriptAlias / /var/www/$1

WSGIPythonPath /var/www/
Alias /static /var/www/static
<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>


" >> /etc/apache2/apache2.conf
#this is for give write permission to user for localdb

chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP  /var/www/*
chown -R $APACHE_RUN_USER:$APACHE_RUN_GROUP  /var/*
chmod -R 755 *.sqlite3
chmod  -R 755 /var/www/*


