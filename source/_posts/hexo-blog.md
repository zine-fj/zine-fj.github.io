---
title: hexo-blog
date: 2018-06-12 10:38:03
categories: 
- 技术
tags:
- 前端
- hexo
- git
---

## 简介
至此，博客的创建算是告一段落了，还记得四天前第一次用 ``hexo new post "article-title" `` 创建一篇博客时的兴奋！
下面简单介绍下所用技术：
主要技术为：nodeJs + git + hexo；
nodeJs和git这里就不多说了，直接去官网下载注册即可，主要说下hexo。

## hexo 本地配置
1. 安装hexo
``` shell
mkdir hexo && cd hexo
npm i hexo-cli -g
npm i hexo --save
```
2. 检测是否安装成功
``` shell
hexo -v
```
3. 初始化
``` shell
hexo init
```
4. 安装依赖包
``` shell
npm i
# 或者 cnpm i  或者  yarn 都可以
```
5. 首次体验hexo
``` shell
hexo g
# 之后每次操作需要看效果调试时直接输入 hexo s 即可
hexo s
```
6. 在浏览器中打开 http://localhost:4000 可预览hexo，至此，hexo本地配置成功

## 将hexo与github page联系起来
1. 配置git个人信息
``` shell
git config --global urser.name "zine-fj"
git config --global user.email "747810974@qq.com"

#生成秘钥
ssh-keygen -t rsa -C "747810974@qq.com"
```
1. 配置Deployment，在hexo根目录中的 ``_config.yml``，找到Deployment，然后操作如下：
``` shell
deploy:
  type: git
  repo: git@github.com:yourname/yourname.github.io.git
  branch: master
```

## 写博客、发布文章
1. 新建一篇博客
``` shell
hexo new post "article name"
```
2. 这时候在目录 ``hexo\source\_posts``中将会看到 ``article name.md`` 文件，使用MarDown编辑方式编辑即可
3. 生成、部署
``` shell
# 生成
hexo g
# 部署
hexo d

# 当然也可以一步操作(我经常这样)
hexo d -g
```
4. 成功后访问你的地址 ``yourname.github.io`` 即可看到生成的文章，比如我的(https://zine-fj.github.io)

注意：
* 需要提前安装一个扩展
``` shell
npm i hexo-deployer-git --save
```
* 如果出现 ``publickey`` 错误信息，则可能是秘钥配置问题，查看另一篇博客 hexo-git-ssh

## 主题推荐
两个主题推荐：
一个是github上Star排名第五的[Yilia](http://litten.me/)，
另一个是github上Star排名第一的[next](https://notes.iissnan.com/)。
我目前用的是next的主题

## Next主题配置
在官网中看文档即可，看这个官网可以少踩很多坑...
[Next主题配置官网](http://theme-next.iissnan.com/getting-started.html)

1. 注意区分：有两个 ``_config.yml`` 文件，一个在根目录，一个在主题(next)目录。
2. 主题切换：在根目录中修改：
``` shell
theme:next
```
3. 推荐使用Next中三个主题中的第三个主题 ``Pisces``
4. 剩下的，还是看官网吧！

## 添加评论
* 来必力：https://livere.com （来自韩国，使用邮箱注册。）
* 畅言： http://changyan.kuaizhan.com （安装需要备案号。不太好用。）
* Gitment： https://github.com/imsun/gitment （有点小bug，比如说每次需要手动初始化，登录时会跳到主页。。）
* Valine: https://github.com/xCss/Valine (基于Leancloud的极简风评论系统，用了下，没效果，是我Next主题的原因还是？）
所以最终推荐使用：来比力，注册登录运行
在代码管理中找到 ``data-id`` 将其拷贝到主题目录下的 ``_config.yml`` 中的 ``livere_uid``
注意：如果不行，在主题目录下 ``layout\_partials\comments.swig`` 找到 ``noscript`` 所在的判断语句，删除其下内容即可

参考网址：(https://blog.csdn.net/gdutxiaoxu/article/details/53576018)