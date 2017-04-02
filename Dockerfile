FROM andrey9kin/base-image:1.0.0

RUN apk add --no-cache monit==5.20.0-r0

COPY conf.d /etc/monit/conf.d
COPY monitrc /etc/

RUN chmod 600 /etc/monitrc \
    && mkdir -p /var/lib/monit/events

EXPOSE 2812

CMD ["dumb-init", "--", "monit", "-Ic", "/etc/monitrc"]