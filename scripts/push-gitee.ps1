# Gitee Pages 已于 2024 年下线，此脚本仅用于代码镜像备份
param(
    [string]$GiteeUser = "jintianlei",
    [string]$Repo = "pdf-word-helper"
)

$ErrorActionPreference = "Stop"
Set-Location (Split-Path $PSScriptRoot -Parent)

Write-Host ">>> 注意：Gitee Pages 已停止服务，无法再部署静态网站。" -ForegroundColor Yellow
Write-Host ">>> 国内访问请使用 Cloudflare Pages，见 .github/workflows/deploy-cloudflare.yml" -ForegroundColor Yellow
Write-Host ""

$remoteUrl = "https://gitee.com/$GiteeUser/$Repo.git"
git remote get-url gitee 2>$null | Out-Null
if ($LASTEXITCODE -eq 0) { git remote remove gitee }
git remote add gitee $remoteUrl
git push -u gitee main

Write-Host ">>> 代码已同步到 Gitee（仅作备份，无法开 Pages）"
