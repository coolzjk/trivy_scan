# 使用最新的、经过安全更新的Alpine Linux基础镜像
FROM alpine:3.19.1

# 设置维护者标签
LABEL maintainer="security-team@company.com"
LABEL description="Secure Dockerfile for Trivy Demo"

# 更新包管理器并升级所有包到最新版本
RUN apk update && apk upgrade --no-cache
RUN apk add --no-cache \
    nodejs \
    npm \
    curl

RUN addgroup -g 1000 -S appuser && \
    adduser -u 1000 -S appuser -G appuser

WORKDIR /app

COPY package*.json ./

RUN npm ci --only=production && \
    npm cache clean --force

COPY . .

RUN chown -R appuser:appuser /app

USER appuser

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=3s \
  CMD curl -f http://localhost:3000/health || exit 1

CMD ["npm", "start"]