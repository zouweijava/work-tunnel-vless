FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl tzdata

# 直接下载二进制文件，不使用zip，彻底解决解压报错
RUN curl -L --ipv4 -o work-tunnel \
    https://github.com/luck666/work-tunnel-vless/raw/main/work-tunnel-linux-amd64

RUN chmod +x work-tunnel

# 环境变量（back4app 后台可以覆盖）
ENV UUID=00000000-0000-0000-0000-000000000000
ENV VLESS_WSPATH=/api-vless
ENV PORT=8080

EXPOSE 8080

CMD ["/app/work-tunnel"]
