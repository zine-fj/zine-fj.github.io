---
title: Hexo搭建博客不同电脑异步问题
date: 2018-06-12 14:26:10
categories: 
- Hexo
tags:
- Git
- nodeJs
description: Hexo搭建博客不同电脑异步问题!!!!
---
## hexo更换电脑时同步问题
当你在公司的一台电脑上成功部署完hexo并且发表一篇博客时，别着急激动！有没有想过回家后还想用hexo怎么办呢？

思路：在生成的已经推到github上的hexo静态代码上简历一个分支，利用这个分支来管理自己的hexo源文件

## 具体操作
1. 克隆github上面生成的静态文件到本地
``` powershell
git clone https://github.com/zine-fj/zine-fj.github.io.git
```
2. 把克隆到本地的文件除了git的文件都删掉，找不到git的文件的话就都删了吧。不要用 ``hexo init`` 初始化。
3. 将之前使用hexo写博客时的整个目录(所有文件)搬过来。把该忽略的文件忽略
``` powershell
touch .gitignore
```
4. 切换并创建一个叫hexo的分支
``` powershell
git checkout -b hexo

# 切换分支
git checkout hexo

# 查看分支
git branch
```
5. 将复制过来的文件推送到github
``` powershell
git add .
git commit -m "新建分支"
git remote add origin https://github.com/zine-fj/zine-fj.github.io.git
git push -u origin hexo
```
6. 以后在其他电脑上用hexo写博客，就可以直接将创建的分支克隆下来
``` powershell
git clone -b hexo https://github.com/zine-fj/zine-fj.github.io.git hexo
```
7. 克隆下来后首先在此文件夹中通过命令提示符输入 ``hexo -v`` 查看hexo是否可用。若不可用则根据提示安装(注意：用cnpm安装可能会有问题)
``` powershell
npm i hexo --save
```
8. 接着安装依赖包
``` powershell
yarn
```
9. 执行hexo操作
``` powershell
在本地查看示例(localhost:4000)
hexo g
hexo s

hexo new post "title"
hexo d -g
```

## 注意
1. 如果 ``hexo d -g``部署没有成功并显示 ``Host key verification failed``则说明本地电脑没有ssh秘钥(我的做法是再建立一个秘钥)
2. 做完之后，每次写完博客发布之后，不要忘了还要(在当前文件夹中) ``git push`` 把源文件推到分支上
3. 如果用 ``hexo s`` 查看 [localhost:4000](localhost:4000) 是空白的话，可能是因为没有获取到主题(主题在 ``themes`` 文件夹中)。
