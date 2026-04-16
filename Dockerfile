FROM alpine:latest

WORKDIR /app

RUN apk add --no-cache curl unzip

# 下载 work-tunnel-vless 核心程序
RUN curl -L -o work-tunnel.zip https://github.com/luck666/work-tunnel-vless/releases/download/v1.0/work-tunnel-linux-amd64.zip
RUN unzip work-tunnel.zip && chmod +x work-tunnel

# 环境变量（back4app 会自动覆盖这里的值）
ENV UUID=00000000-0000-0000-0000-000000000000
ENV VLESS_WSPATH=/api-vless
ENV PORT=8080

EXPOSE 8080

CMD ["/app/work-tunnel"]
