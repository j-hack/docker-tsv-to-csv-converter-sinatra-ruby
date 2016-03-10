FROM gliderlabs/alpine:latest
MAINTAINER Nobutaka OSHIRO <n-oshiro@j-hack.co.jp>
COPY ["./app", "*.sh", "/app/"]
RUN ["/app/prepare.sh"]
EXPOSE 5678
CMD ["foreman", "start", "-d", "/app"]