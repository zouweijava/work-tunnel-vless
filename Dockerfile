FROM golang:alpine AS builder

WORKDIR /app

RUN apk add --no-cache git

# 直接从源码编译，彻底解决文件下载失败问题
RUN git clone https://github.com/zouweijava/work-tunnel-vless.git /src
WORKDIR /src
RUN go build -o work-tunnel main.go

FROM alpine:latest
WORKDIR /app

COPY --from=builder /src/work-tunnel /app/

RUN chmod +x work-tunnel

ENV UUID=00000000-0000-0000-0000-000000000000
ENV VLESS_WSPATH=/api-vless
ENV PORT=8080

EXPOSE 8080

CMD ["/app/work-tunnel"]
