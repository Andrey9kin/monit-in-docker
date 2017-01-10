FROM alpine:3.5

RUN apk add -U monit \
    && rm -rf /var/cache/apk/*

COPY conf.d /etc/monit/conf.d
COPY monitrc /etc/

RUN chmod 600 /etc/monitrc \
    && mkdir -p /var/lib/monit/events

EXPOSE 2812

CMD ["monit", "-Ic", "/etc/monitrc"]