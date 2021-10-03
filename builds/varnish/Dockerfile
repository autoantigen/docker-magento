#FROM centos:centos7
#MAINTAINER Mykola Girnyi mykola.gir@gmail.com

#RUN yum update -y && \
#  yum install -y epel-release && \
#  yum install -y varnish && \
#  yum install -y libmhash-devel && \
#  yum clean all

#RUN chkconfig --level 345 varnishncsa on
#ADD start.sh /start.sh
#RUN chmod +x /start.sh
#COPY ./varnish.vcl /etc/varnish/
#COPY ./varnish_66.vcl /etc/varnish/default.vcl
#COPY ./magento.vcl /etc/varnish/
#COPY ./varnish.params /etc/varnish/

#ENV VCL_CONFIG      /etc/varnish/default.vcl
#ENV CACHE_SIZE      64m
#ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600
#ENV DAEMON_OPTS="-a -w ${LOGFILE} -D -P ${PIDFILE} -c"

#CMD /start.sh

FROM million12/varnish

MAINTAINER Ash Smith <ash.smith@meanbee.com>

ADD ./varnish.vcl /data/varnish.vcl

ENV VCL_CONFIG /data/varnish.vcl
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600 -p feature=+esi_ignore_https -p feature=+esi_disable_xml_check
