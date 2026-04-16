FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl

# 直接下载你仓库里已经编译好的二进制文件（最稳）
RUN curl -L https://github.com/zouweijava/work-tunnel-vless/raw/main/work-tunnel-linux-amd64 -o work-tunnel

RUN chmod +x work-tunnel

ENV UUID=00000000-0000-0000-0000-000000000000
ENV VLESS_WSPATH=/api-vless
ENV PORT=8080

EXPOSE 8080

CMD ["/app/work-tunnel"]
