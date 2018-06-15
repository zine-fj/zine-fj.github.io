---
title: Git秘钥问题
date: 2018-06-12 11:12:14
categories: 
- Hexo
tags:
- Git
---
## 简介
在管理Git项目上，很多时候都是直接使用https url克隆到本地，当然也有有些人使用SSH url克隆到本地。

这两种方式的主要区别在于：使用https url克隆对初学者来说会比较方便，复制https url然后到git Bash里面直接用clone命令克隆到本地就好了，但是每次fetch和push代码都需要输入账号和密码，这也是https方式的麻烦之处。

而使用SSH url克隆却需要在克隆之前先配置和添加好SSH key，因此，如果你想要使用SSH url克隆的话，你必须是这个项目的拥有者。否则你是无法添加SSH key的，另外ssh默认是每次fetch和push代码都不需要输入账号和密码，如果你想要每次都输入账号密码才能进行fetch和push也可以另外进行设置。前面的几篇介绍Git的博客里面采用的都是https的方式作为案例，

今天主要是讲述如何配置使用ssh方式来提交和克隆代码

## 设置
1. 设置git的user和email：(如果是第一次的话)
``` shell
git config --global user.name "zine-fj"
git config --global user.email "747810974@qq.com"
```
2. 检查是否已经有SSH Key
``` shell
cd ~/.ssh

# 接着输入(注意是字母的l)
ls
```
列出该文件下的文件，看是否存在 id_isa 和 id_isa.pub 文件（也可以是别的文件名，只要 yourName 和 yourName.pub 承兑存在），如果存在的话，证明已经存在 ssh key了，可以直接跳过 生成密钥 这一步骤
3. 生成秘钥
``` shell
ssh-keygen -t rsa -C "747810974@qq.com"
```
连续3个回车。如果不需要密码的话。 
最后得到了两个文件：id_rsa和id_rsa.pub。

默认的存储路径是：``C:\Users\Administrator\.ssh``
4. 添加密钥到ssh-agent
确保 ssh-agent 是可用的。ssh-agent是一种控制用来保存公钥身份验证所使用的私钥的程序，其实ssh-agent就是一个密钥管理器，运行ssh-agent以后，使用ssh-add将私钥交给ssh-agent保管，其他程序需要身份验证的时候可以将验证申请交给ssh-agent来完成整个认证过程。
``` shell
eval "$(ssh-agent -s)"

# 添加生成的SSH Key到ssh-agent。
ssh-add ~/.ssh/id_rsa
```
5. 登录github，添加ssh
把id_rsa.pub文件里的内容复制到这里： github 中 setting 中的 SSH and GPG keys
6. 测试
``` shell
ssh -T git@github.com
```
如果看到Hi后面是你的用户名，就说明成功了。

参考网址：https://blog.csdn.net/gdutxiaoxu/article/details/53573399