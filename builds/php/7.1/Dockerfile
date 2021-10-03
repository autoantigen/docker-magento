FROM thecodingmachine/php:7.1-v3-fpm

ENV PHP_INI_MEMORY_LIMIT=1G
ENV PHP_EXTENSION_BCMATH=1
ENV PHP_EXTENSION_GD=1
ENV PHP_EXTENSION_MCRYPT=1
ENV PHP_EXTENSION_REDIS=1
ENV PHP_EXTENSION_IMAGICK=1
ENV PHP_EXTENSION_SODIUM=1
ENV PHP_EXTENSION_MEMCACHED=0
ENV PHP_EXTENSION_INTL=1
ENV PHP_EXTENSION_XSL=1
ENV PHP_INI_ERROR_REPORTING="E_ALL & ~E_DEPRECATED"
ENV PHP_INI_XDEBUG__IDEKEY=PHPSTORM
ENV PHP_INI_XDEBUG__PROFILER_ENABLE=0
ENV PHP_INI_XDEBUG__REMOTE_AUTOSTART=1
ENV PHP_INI_XDEBUG__REMOTE_CONNECT_BACK=1
ENV PHP_INI_XDEBUG__MAX_NESTING_LEVEL=512
ENV PHP_INI_XDEBUG__PROFILER_ENABLE_TRIGGER=1
ENV PHP_INI_XDEBUG__PROFILER_OUTPUT_DIR=/var/www/html/profiler
ENV PHP_INI_XDEBUG__REMOTE_AUTOSTART=1
ENV PHP_INI_XDEBUG__MAX_NESTING_LEVEL=512
ENV PHP_INI_MAX_INPUT_VARS=10000
ENV PHP_INI_MAX_EXECUTION_TIME=1000
ENV PHP_INI_DISPLAY_ERRORS=on
ENV PHP_EXTENSION_XDEBUG=1
ENV PHP_INI_SENDMAIL_PATH="/usr/bin/mhsendmail --smtp-addr mailhog:1025"

USER root
RUN apt-get update &&\
    apt-get install --no-install-recommends --assume-yes --quiet ca-certificates curl git wget &&\
    rm -rf /var/lib/apt/lists/*
RUN curl -Lsf 'https://storage.googleapis.com/golang/go1.8.3.linux-amd64.tar.gz' | tar -C '/usr/local' -xvzf -
ENV PATH /usr/local/go/bin:$PATH
RUN go get github.com/mailhog/mhsendmail
RUN cp /root/go/bin/mhsendmail /usr/bin/mhsendmail

# install ouncube

RUN wget http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz
RUN tar xzf ioncube_loaders_lin_x86-64.tar.gz -C /usr/local
RUN echo "zend_extension = /usr/local/ioncube/ioncube_loader_lin_7.1.so" >> /etc/php/7.1/fpm/conf.d/10-ioncube.ini


USER docker
