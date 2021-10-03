#!/bin/bash

for i in $(ls /etc/nginx/sites-available/); do
    SSL_SUBJECT="$(echo $i | awk -F'.conf' '{ print $1 }')"
    export SSL_SUBJECT;
    echo 'Generating new ssl script' ${SSL_SUBJECT};

    if [ ! -d "/certs/${SSL_SUBJECT}" ]; then
        mkdir /certs/${SSL_SUBJECT};
        cp /certs/certs-generator.sh /certs/${SSL_SUBJECT};
        cd /certs/${SSL_SUBJECT}/;
        ./certs-generator.sh;
    fi

    ln -s /etc/nginx/sites-available/${SSL_SUBJECT}.conf /etc/nginx/sites-enabled/${SSL_SUBJECT}.conf;
    done;