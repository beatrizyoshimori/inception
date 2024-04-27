FROM alpine:3.18

RUN apk update && apk add nginx openssl

RUN mkdir -p /etc/nginx
ADD ./conf/nginx.conf /etc/nginx/nginx.conf

WORKDIR /etc/nginx
RUN if [ ! -f certificate.pem ]; then \
    openssl req \
    -x509 \
    -newkey \
    rsa:4096 \
    -sha256 \
    -days 365 \
    -nodes \
    -keyout certificate.pem \
    -out certificate.pem.pub \
    -subj "/C=BR/ST=SP/L=SaoPaulo/O=42/OU=42/CN=byoshimo@42.fr"; \
fi

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]