# Weibo login plugin for Discourse / Discourse 微博登录插件

Authenticate with discourse with Weibo.

通过微博登录 Discourse。

## Register Client Key & Secert / 申请微博接入

1. 登录[微博开发者中心](http://open.weibo.com/connect?bottomnav=1&wvr=5)，注册填写相关信息。
2. 点击`开始接入`。
3. 填写相关信息。`网站域名`可填写根域名或者具体域名。如图所示。（验证所需要的标签可在 Discourse 设置中插入，验证后即可删除）
4. 在申请到的后台找到`网站信息`的`基本信息`一栏，获得`key`和`secret`，将其填入Discourse 设置中。

<img src="https://meta.discourse.org/uploads/default/34524/32ac2f59e766ca9f.png" width="527" height="500">

## Installation / 安装

Run `rake plugin:install repo=https://github.com/fantasticfears/weibo-login` in your discourse directory

In development mode, run `rake assets:clean`

In production, recompile your assets: `rake assets:precompile`

在您 Discourse 目录中运行 `rake plugin:install repo=https://github.com/fantasticfears/weibo-login`

在开发者模式下，运行 `rake assets:clean`

在生产模式下，重编译 assets `rake assets:precompile`

## Usage / 使用

Go to Site Settings's login category, fill in the client id and client secret.

进入站点设置的登录分类，填写 client id 和 client serect。

## Issue / 问题

Visit [topic on Discourse Meta](https://meta.discourse.org/t/weibo-login-plugin/19735) or [GitHub Issues](https://github.com/fantasticfears/weibo-login/issues).

访问[Discourse Meta上的主题](https://meta.discourse.org/t/weibo-login-plugin/19735)或[GitHub Issues](https://github.com/fantasticfears/weibo-login/issues)。

## Changelog

Current version: 0.1.0
