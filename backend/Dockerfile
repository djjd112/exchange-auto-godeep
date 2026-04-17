FROM golang:1.23.4 AS builder

# 启用 Go module
ENV GO111MODULE=on \
    #GOPROXY=https://goproxy.cn,direct \
    TZ=Asia/Shanghai

# 设置语言环境
ENV LANG=C.UTF-8

# 设置工作目录
WORKDIR /build

# 复制项目文件到容器中
COPY . .

# 下载依赖
RUN go mod tidy

# 编译可执行文件
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o exchange-auto-godeep .

FROM alpine:3.10

LABEL maintainer="wanyuxiang000@163.com"

# 设置时区为上海
ENV TZ=Asia/Shanghai

# 设置运行环境，默认为生产环境
ENV RUN_MODE=prod

# 使用阿里云的Alpine镜像源并安装tzdata
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache tzdata && \
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo $TZ > /etc/timezone

WORKDIR /app

# 从builder阶段复制i18n目录和可执行文件
COPY --from=builder /build/.env .
COPY --from=builder /build/exchange-auto-godeep .

# 暴露端口
EXPOSE 8080

# 启动命令
ENTRYPOINT ["/app/exchange-auto-godeep"]
