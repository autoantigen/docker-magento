#!/usr/bin/env bash

[ "$DEBUG" = "true" ] && set -x


# Configure Sendmail if required
if [ "$ENABLE_SENDMAIL" == "true" ]; then
    /etc/init.d/sendmail start
fi

# Configure Xdebug
echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.remote_mode=req" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.remote_host=172.17.0.1" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.remote_connect_back=0" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.discover_client_host=1" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.idekey=PHPSTORM" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.remote_autostart=1" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.remote_connect_back=1" >> /usr/local/etc/php/conf.d/zz-xdebug.ini
echo "xdebug.max_nesting_level=512" >> /usr/local/etc/php/conf.d/zz-xdebug.ini


# Execute the supplied command
exec "$@"
