#!/bin/bash

SITE_FOLDER=$1
echo "Change owner on all sites"
echo ""
echo "chown -R -F www-data:www-data /var/www"
chown -R -f www-data:www-data /var/www
echo "Securing the entire site $SITE_FOLDER"
echo ""
echo "chmod 755 -type d /var/www/$SITE_FOLDER"
find /var/www/$SITE_FOLDER -type d -exec chmod 755 {} \;
echo "chmod 755 -type f /var/www/$SITE_FOLDER"
find /var/www/$SITE_FOLDER -type f -exec chmod 644 {} \;
echo "chmod 640 /var/www/$SITE_FOLDER/*.php"
chmod 640 /var/www/$SITE_FOLDER/*.php
echo "chmod 640 -type f /var/www/$SITE_FOLDER/wp-admin"
find /var/www/$SITE_FOLDER/wp-admin -type f -exec chmod 640 {} \;
echo "chmod 640 -type d /var/www/$SITE_FOLDER/wp-admin"
find /var/www/$SITE_FOLDER/wp-includes -type f -exec chmod 640 {} \;
echo "chmod 440 /var/www/$SITE_FOLDER/.htaccess"
chmod 644 /var/www/$SITE_FOLDER/.htaccess
echo "chmod 766 /var/www/$SITE_FOLDER/sitemap.*"
chmod 766 /var/www/$SITE_FOLDER/sitemap.*
echo "chown -R www-data:www-data /var/www/$SITE_FOLDER/wp-content/uploads"
chown -R -f www-data:www-data /var/www/$SITE_FOLDER/wp-content/uploads
chmod 777 -R /var/www/$SITE_FOLDER/wp-content/uploads
find /var/www/$SITE_FOLDER/wp-content/uploads -type f -exec chmod 660 {} \;
chmod 770 -R /var/www/$SITE_FOLDER/wp-content/upgrade
chmod 750 -R /var/www/$SITE_FOLDER/wp-content/plugins
find /var/www/$SITE_FOLDER -name 'index.php' -exec chmod 640 {} \;
echo "Done"
