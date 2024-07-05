FROM alpine:latest

ARG TARGETPLATFORM=linux/amd64

COPY download_webproc.sh /download_webproc.sh

RUN apk update \
	&& apk --no-cache add dnsmasq \
	&& apk add --no-cache --virtual .build-deps curl \
	&& /download_webproc.sh \
	&& chmod +x /usr/local/bin/webproc \
	&& apk del .build-deps

COPY config/dnsmasq.conf /etc/dnsmasq.conf
COPY config/domains.list /etc/domains.list

ENTRYPOINT ["webproc","--configuration-file","/etc/dnsmasq.conf","--configuration-file","/etc/domains.list","--","dnsmasq","--no-daemon"]
