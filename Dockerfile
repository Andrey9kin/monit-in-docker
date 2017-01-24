FROM alpine:3.5

# Support for proxies.
# Values should be passed as build args
# http://docs.docker.com/engine/reference/builder/#arg
ENV http_proxy ${http_proxy:-}
ENV https_proxy ${https_proxy:-}
ENV no_proxy ${no_proxy:-}
ARG JAVA_OPTS
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false ${JAVA_OPTS:-}"

RUN apk add -U monit \
    && rm -rf /var/cache/apk/*

COPY conf.d /etc/monit/conf.d
COPY monitrc /etc/

RUN chmod 600 /etc/monitrc \
    && mkdir -p /var/lib/monit/events

EXPOSE 2812

CMD ["monit", "-Ic", "/etc/monitrc"]