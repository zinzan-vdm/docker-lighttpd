FROM alpine:latest
LABEL VERSION=1.0.0

# This image is massively inspired by https://github.com/jitesoft/docker-lighttpd

ARG WWWDATA_GUID='82'

WORKDIR /

RUN adduser -u ${WWWDATA_GUID} -S www-data -G www-data \
  && apk add --no-cache \
    brotli \
    lighttpd \
    lighttpd-mod_auth \
  && mkdir -p /etc/lighttpd/conf.d /usr/local/lighttpd.d /var/www/html/ \
  && lighttpd -V

ADD --chmod=555 app.sh /app.sh
ADD configuration/lighttpd.conf /etc/lighttpd/lighttpd.conf
ADD configuration/conf.d /etc/lighttpd/conf.d

ENV \
  LIGHTTPD_PORT='80' \
  LIGHTTPD_SERVER_NAME='localhost' \
  LIGHTTPD_SERVER_ROOT='/var/www/html/' \
  LIGHTTPD_CONFIG_FILE='/etc/lighttpd/lighttpd.conf' \
  LIGHTTPD_MAX_FDS='1024'

ENTRYPOINT ["/app.sh"]
