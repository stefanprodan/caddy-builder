# Build
FROM golang:1.9-alpine as builder

ARG CADDY_VERSION="0.10.9"

RUN apk add --no-cache curl git

# clone caddy
RUN git clone https://github.com/mholt/caddy -b "v$CADDY_VERSION" /go/src/github.com/mholt/caddy \
    && cd /go/src/github.com/mholt/caddy \
    && git checkout -b "v$CADDY_VERSION"

# import plugins
COPY plugins.go /go/src/github.com/mholt/caddy/caddyhttp/plugins.go

# clone builder
RUN git clone https://github.com/caddyserver/builds /go/src/github.com/caddyserver/builds

# build caddy
RUN cd /go/src/github.com/mholt/caddy/caddy \
    && go get ./... \
    && go run build.go \
    && mv caddy /go/bin


# Pack
FROM alpine:3.6

# install deps
RUN apk add --no-cache --no-progress openssh-client git tini ca-certificates

# copy caddy binary
COPY --from=builder /go/bin/caddy /usr/bin/caddy

# list plugins
RUN /usr/bin/caddy -plugins

EXPOSE 80 443 9180

VOLUME ["/www", "/.caddy"]
WORKDIR /www

COPY Caddyfile /etc/caddy/Caddyfile
COPY index.html /www/index.html

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["caddy", "-agree", "--conf", "/etc/caddy/Caddyfile"]
