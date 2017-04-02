FROM andrey9kin/base-image:1.0.0

RUN apk add --no-cache monit==5.20.0-r0 && mkdir /var/lib/monit

COPY start.sh /start.sh

VOLUME /monit-cfg

EXPOSE 2812

CMD ["dumb-init", "--", "/bin/sh", "/start.sh"]