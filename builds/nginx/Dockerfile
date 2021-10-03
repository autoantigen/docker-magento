FROM nginx:stable

COPY nginx.conf /etc/nginx/

RUN rm -rf /etc/nginx/sites-available
RUN rm -rf /etc/nginx/sites-enabled
RUN mkdir -p /etc/nginx/sites-enabled
RUN mkdir -p /etc/nginx/sites-available
#RUN apt-get update && apt-get install -y openssl software-properties-common dirmngr --install-recommends

COPY ./*.sh /certs/
RUN chmod +x /certs/*.sh
COPY projects-configs/ /etc/nginx/sites-available/
RUN /certs/generate-certs.sh

CMD ["nginx", "-g", "daemon off;"]
