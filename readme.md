# Vaultwarden Caddy

## CI

- GitHub Actions 工作流：`.github/workflows/build-ghcr.yml`
- 触发方式：手动触发 + 每月一次定时触发
- 定时表达式：`0 3 1 * *`（UTC），即北京时间每月 1 日 11:00
- 产物仓库：`ghcr.io/zsnmwy/vaultwarden-caddy-cloudflare`
- 构建目标：根目录 `Dockerfile`
- 支持平台：`linux/amd64`、`linux/arm64`
- 推送标签：`latest`、`YYYYMM`、`sha-<7位提交>`

## POD ENV

KUBERNETES_SERVICE_PORT_HTTPS=443
KUBERNETES_SERVICE_PORT=443
KUBERNETES_PORT_443_TCP=tcp://192.168.0.1:443
KUBERNETES_PORT_443_TCP_PROTO=tcp
KUBERNETES_PORT_443_TCP_ADDR=192.168.0.1
KUBERNETES_SERVICE_HOST=192.168.0.1
KUBERNETES_PORT=tcp://192.168.0.1:443
KUBERNETES_PORT_443_TCP_PORT=443
