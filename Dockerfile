FROM registry.ng.bluemix.net/rtiffany/rthugo-builder:2 as builder

RUN mkdir -p /var/www/blog

COPY . /var/www/blog

WORKDIR /var/www/blog

RUN hugo -d public -b "https://blog.tinylab.info"

FROM nginx

COPY --from=builder /var/www/blog/public/ /usr/share/nginx/html