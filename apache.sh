#!/bin/bash

echo "
WSGIScriptAlias / /var/www/blog/blog/wsgi.py

WSGIPythonPath /var/www/blog
Alias /static /var/www/blog/static
<Directory /var/www/blog>
        Options Indexes FollowSymLinks
        AllowOverride None
        Require all granted
</Directory>


" >> /etc/apache2/apache2.conf
#this is for give write permission to user for localdb

chown $APACHE_RUN_USER:$APACHE_RUN_GROUP  /var/www/blog
chown $APACHE_RUN_USER:$APACHE_RUN_GROUP  /var/www/blog/db.sqlite3
chmod 644 /var/www/blog/db.sqlite3
