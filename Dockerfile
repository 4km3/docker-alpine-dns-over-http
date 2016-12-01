FROM alpine:3.4
MAINTAINER Rodrigo de la Fuente <rodrigo@delafuente.email>

RUN set -e;                                                 			\
    apk add --no-cache ca-certificates git go gcc musl-dev; 			\
    GOPATH=/tmp/go GOBIN=/ go get -v github.com/wrouesnel/dns-over-https-proxy; \
    apk del git go gcc musl-dev;                            			\
    rm -rf /tmp/go

EXPOSE 53

ENTRYPOINT ["/dns-over-https-proxy"]
