# anti-ad-hosts

[anti-AD](https://github.com/privacy-protection-tools/anti-AD) 广告拦截列表的 hosts 格式镜像。上游官方不提供 hosts 格式，本仓库定时把上游纯域名列表（`domains.txt`）转换为 hosts 格式并自动提交。

数据由 GitHub Actions 每 6 小时从上游拉取一次，无变化则不提交。

## 使用

原始文件（raw 地址，可直接被 hosts 管理工具订阅）：

```
https://raw.githubusercontent.com/igevin/anti-ad-hosts/master/anti-ad.hosts
```

在 [mHost](https://github.com/igevin/mHost) 中：设置 → 广告拦截 → 添加源，填入上面的 URL，并开启自动刷新。

其他支持 hosts 格式订阅的工具（AdGuard Home 改写、AdAway、手动替换 `/etc/hosts` 等）同样可用。

## 许可

上游列表 [anti-AD](https://github.com/privacy-protection-tools/anti-AD) 以 [MIT](./LICENSE) 许可发布，本仓库的转换结果遵循同一许可。转换脚本见 [`scripts/convert.sh`](./scripts/convert.sh)。
