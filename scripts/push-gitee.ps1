# 将代码推送到 Gitee 并提示开启 Pages
param(
    [string]$GiteeUser = "jintianlei",
    [string]$Repo = "pdf-word-helper"
)

$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)

$remoteUrl = "https://gitee.com/$GiteeUser/$Repo.git"
Write-Host ">>> 目标仓库: $remoteUrl"

git remote remove gitee 2>$null
git remote add gitee $remoteUrl
git push -u gitee main

Write-Host ""
Write-Host ">>> 推送完成！请在 Gitee 开启 Pages："
Write-Host "    1. 打开 https://gitee.com/$GiteeUser/$Repo/settings/pages"
Write-Host "    2. 分支选 main，目录选 / （根目录）"
Write-Host "    3. 点击启动/更新"
Write-Host ""
Write-Host ">>> 国内访问地址（部署成功后）："
Write-Host "    https://$GiteeUser.gitee.io/$Repo/"
