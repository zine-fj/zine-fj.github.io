---
title: Hexo有趣功能盘点
date: 2018-06-12 18:59:12
categories: 
- Hexo
tags:
- Git
- nodeJs
---

通过在网上的学习，又在hexo的Next主题中添加了几个比较好玩的东西，如下：
注：此功能某些只对 ``next`` 主题有效。
<!-- more -->
## 添加顶部加载条
1. 主题文件夹下 ``_config.yml``
```shell
pace: true

下面是加载时显示的效果
```

## 添加置顶功能
一种方法是手动对相关文件进行修改，具体可参考[博文置顶](https://www.jianshu.com/p/42a4efcdf8d7)。

另一种方法就是，目前已经有修改后支持置顶的[仓库](https://github.com/netcan/hexo-generator-index-pin-top)，
1. 直接用以下命令安装。
```shell
npm uninstall hexo-generator-index --save
npm install hexo-generator-index-pin-top --save
```
2. 在需要置顶的文章的 ``Front-matter`` 中加上 ``top: true `` 即可。比如下面这篇文章：
```shell
---
title: Hexo好玩的小东西
date: 2018-06-12 18:59:12
top: true
...
---
```
3. 在 ``/blog/themes/next/layout/_macro`` 目录下的 ``post.swig`` 文件，定位到 ``<div class="post-meta">`` 标签下，插入如下代码：
```shell
{% if post.top %}
  <i class="fa fa-thumb-tack"></i>
  <font color=7D26CD>置顶</font>
  <span class="post-meta-divider">|</span>
{% endif %}
```

## 添加点击爱心效果
1. 创建js文件
在 ``/themes/next/source/js/src`` 下新建文件 ``clicklove.js``，接着把该链接下的代码拷贝粘贴到 ``clicklove.js`` 文件中。添加的代码如下：
``` shell
!function(e,t,a){function n(){c(".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}"),o(),r()}function r(){for(var e=0;e<d.length;e++)d[e].alpha<=0?(t.body.removeChild(d[e].el),d.splice(e,1)):(d[e].y--,d[e].scale+=.004,d[e].alpha-=.013,d[e].el.style.cssText="left:"+d[e].x+"px;top:"+d[e].y+"px;opacity:"+d[e].alpha+";transform:scale("+d[e].scale+","+d[e].scale+") rotate(45deg);background:"+d[e].color+";z-index:99999");requestAnimationFrame(r)}function o(){var t="function"==typeof e.onclick&&e.onclick;e.onclick=function(e){t&&t(),i(e)}}function i(e){var a=t.createElement("div");a.className="heart",d.push({el:a,x:e.clientX-5,y:e.clientY-5,scale:1,alpha:1,color:s()}),t.body.appendChild(a)}function c(e){var a=t.createElement("style");a.type="text/css";try{a.appendChild(t.createTextNode(e))}catch(t){a.styleSheet.cssText=e}t.getElementsByTagName("head")[0].appendChild(a)}function s(){return"rgb("+~~(255*Math.random())+","+~~(255*Math.random())+","+~~(255*Math.random())+")"}var d=[];e.requestAnimationFrame=function(){return e.requestAnimationFrame||e.webkitRequestAnimationFrame||e.mozRequestAnimationFrame||e.oRequestAnimationFrame||e.msRequestAnimationFrame||function(e){setTimeout(e,1e3/60)}}(),n()}(window,document);
```

2. 修改_layout.swig
在 ``\themes\next\layout\_layout.swig`` 文件末尾添加：
``` shell
<!-- 页面点击小红心 -->
<script type="text/javascript" src="/js/src/clicklove.js"></script>
```

## 添加网页标题崩溃欺骗搞怪特效
1. 创建js文件
在 ``next\source\js\src`` 文件夹下创建 ``crash_cheat.js``，添加代码如下：
```shell
<!--崩溃欺骗-->
 var OriginTitle = document.title;
 var titleTime;
 document.addEventListener('visibilitychange', function () {
     if (document.hidden) {
         $('[rel="icon"]').attr('href', "/img/TEP.ico");
         document.title = '╭(°A°`)╮ 页面崩溃啦 ~';
         clearTimeout(titleTime);
     }
     else {
         $('[rel="icon"]').attr('href', "/favicon.ico");
         document.title = '(ฅ>ω<*ฅ) 噫又好了~' + OriginTitle;
         titleTime = setTimeout(function () {
             document.title = OriginTitle;
         }, 2000);
     }
 });
```
2. 引用
在 ``next\layout\_layout.swig`` 文件中，添加引用（注：在``swig``末尾添加）：
```shell
<!--崩溃欺骗-->
<script type="text/javascript" src="/js/src/crash_cheat.js"></script>
```

## 接入网页的在线联系功能
1. 首先在[DaoVoice](http://www.daovoice.io/)注册个账号。
2. 完成后，会得到一个 ``app_id``，后面会用到
3. 修改 ``/themes/next/layout/_partials/head.swig`` 文件，添加内容如下：
```shell
{% if theme.daovoice %}
  <script>
  (function(i,s,o,g,r,a,m){i["DaoVoiceObject"]=r;i[r]=i[r]||function(){(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;a.charset="utf-8";m.parentNode.insertBefore(a,m)})(window,document,"script",('https:' == document.location.protocol ? 'https:' : 'http:') + "//widget.daovoice.io/widget/0f81ff2f.js","daovoice")
  daovoice('init', {
      app_id: "{{theme.daovoice_app_id}}"
    });
  daovoice('update');
  </script>
{% endif %}
```
4. 在主题配置文件 ``_config.yml`` 文件中添加内容：
```shell
# Online contact
daovoice: true
daovoice_app_id:   # 这里填你刚才获得的 app_id
```
网页的在线联系功能已经完成，重新hexo g，hexo d上传GitHub后，页面上就能看到效果了。
效果请看右下角

## 给每篇文章后添加结束标语
1. 在 ``\themes\next\layout\_macro`` 中新建 ``passage-end-tag.swig`` 文件，添加代码至该文件中：
```shell
<div>
    {% if not is_index %}
        <div style="text-align:center;color: #ccc;font-size:16px;font-family: cursive;">-------------纸短情长 <i class="fa fa-umbrella"></i> 下次再见-------------</div>
    {% endif %}
</div>
```
2. 打开 ``\themes\next\layout\_macro\post.swig`` 文件，在 ``post-body`` 后，``post-footer`` 前，添加下面内容：
```shell
<div>
  {% if not is_index %}
    {% include 'passage-end-tag.swig' %}
  {% endif %}
</div>
```
3. 打开主题配置文件 ``_config.yml``,在末尾添加：
```shell
# 文章末尾添加“本文结束”标记
passage_end_tag:
  enabled: true
```
此刻，看下面，这就是结束语啦

## 添加网页音乐播放器功能
1. 点击访问Aplayer源码：[GitHub Aplayer](https://github.com/MoePlayer/APlayer)。下载到本地，解压后将dist文件夹复制到  ``themes\next\source`` 文件夹下。
2. 新建 ``themes\next\source\dist\music.js`` 文件，添加内容：
```shell
const ap = new APlayer({
    container: document.getElementById('aplayer'),
    fixed: true,
    autoplay: true,
    volume: 0.3,
    loop: 'all',
    audio: [
      {
        name: "逍遥叹",
        artist: '徐薇',
        url: 'http://other.web.ri01.sycdn.kuwo.cn/resource/n3/24/12/4042158646.mp3',
        cover: 'http://imge.kugou.com/stdmusic/20171117/20171117142652315559.jpg',
      },
      {
        name: '红昭愿',
        artist: '音阙诗听',
        url: 'http://up.mcyt.net/?down/45962.mp3',
        cover: 'http://imge.kugou.com/stdmusic/20170407/20170407225248906484.jpg',
      },
      {
        name: '时间煮雨',
        artist: '郁可唯',
        url: 'http://up.mcyt.net/?down/37600.mp3',
        cover: 'http://imge.kugou.com/stdmusic/20130625/20130625181709936236.jpg',
      },
      {
        name: '爱情转移',
        artist: '陈奕迅',
        url: 'http://other.web.ra01.sycdn.kuwo.cn/resource/n2/320/52/97/1397406180.mp3',
        cover: 'http://imge.kugou.com/stdmusic/20161010/20161010200518926406.jpg',
      }
    ]
});
```
源码中对应的参数解释，这边都有：[Aplayer 中文文档](https://aplayer.js.org/#/zh-Hans/)

audio对应的便是音频文件，所以音乐播放器需要播放的音乐是需要自己进行相关信息（如歌曲链接、歌词、封面等）的配置。这里放一个mp3音乐外链网站：(http://www.170mv.com/tool/song/) ，搜索酷我中对应的音乐，然后解析出外联网址；对应土平的话可以在酷狗上找到并单击右键保存。

注：由于该外链网站没有歌词链接，我这边没有进行配置，所以播放器在播放音乐时点击歌词是没有显示的。
3. 打开 ``themes\next\layout\_layout.swig`` 文件，将以下文件添加到 ``<body itemscope ...>`` 后面就行，即在 ``<body></body>`` 里面。
```shell
<link rel="stylesheet" href="/dist/APlayer.min.css">
<div id="aplayer"></div>
<script type="text/javascript" src="/dist/APlayer.min.js"></script>
<script type="text/javascript" src="/dist/music.js"></script>
```
4. 重新生成，访问页面，就能看到左下角的音乐播放器了。


## 添加百度分享功能
1. 因为在配置百度分享功能时需指定其type，在 ``next\layout_partials\share\baidushare.swig`` 文件中代码显示:
```shell
{% if theme.baidushare.type === "button" %}
...
...
{% elseif theme.baidushare.type === "slide" %}
...
...
```
2. 所以将主题配置_config.yml文件中关于baidushare部分的内容改为(其中type为slide时有用)：
```shell
baidushare:
  type: slide
  baidushare: true
```
3. 主题文件 ``_config.yml`` 中提示：``Warning: Baidu Share does not support https.`` 因为百度分享不支持在 ``https`` 上使用，所以一种解决方法便是，直接放文件到我们自己的目录下面。

访问链接：[static文件夹](https://github.com/hrwhisper/baiduShare)
下载压缩包到本地，解压后，将 ``static`` 文件夹保存至 ``themes\next\source`` 目录下。

4. 修改文件：``themes\next\layout_partials\share\baidushare.swig``文件
```shell
#  将 末尾 部分的代码：
.src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
# 改为：
.src='/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
```
5. 最后重新生成下，就能展示分享功能了。

## 添加字数统计、阅读时长
1. NexT 主题默认已经集成了文章【字数统计】、【阅读时长】统计功能，如果我们需要使用，只需要在主题配置文件 ``_config.yml`` 中打开 ``wordcount`` 统计功能即可。如下所示：
```shell
post_wordcount:
  item_text: true
  wordcount: true  # 单篇 字数统计
  min2read: false  # 单篇 阅读时长
  totalcount: true # 网站 字数统计
  separated_meta: false
```
2. 修改完主题配置，启用服务预览时，如果出现错误，一般是因为没有安装 ``hexo-wordcount`` 插件
```shell
npm i --save hexo-wordcount
```
3. 打开 ``next/layout/_macro/post.swig`` 修改字数统计、阅读时长(只需要添加文字即可)：
```shell
<span title="{{ __('post.wordcount') }}">
    {{ wordcount(post.content) }} 字
</span>

<span title="{{ __('post.min2read') }}">
    {{ min2read(post.content) }} 分钟
</span>
```



## 添加博客运行时间
找到文件 ``next/layout/_partials/footer.swig`` ，将下面内容复制粘贴进去即可：
```shell
<section class="footer-time">
    <span class="footer__copyright">
    <div>
    <span id="span_dt_dt"> </span>
    <script language="javascript">
      function show_date_time(){
        window.setTimeout("show_date_time()", 1000);
        BirthDay=new Date("6/8/2018 10:56:12");//这个日期是可以修改的
        today=new Date();
        timeold=(today.getTime()-BirthDay.getTime());//其实仅仅改了这里
        sectimeold=timeold/1000
        secondsold=Math.floor(sectimeold);
        msPerDay=24*60*60*1000
        e_daysold=timeold/msPerDay
        daysold=Math.floor(e_daysold);
        e_hrsold=(e_daysold-daysold)*24;
        hrsold=Math.floor(e_hrsold);
        e_minsold=(e_hrsold-hrsold)*60;
        minsold=Math.floor((e_hrsold-hrsold)*60);
        seconds=Math.floor((e_minsold-minsold)*60);
        span_dt_dt.innerHTML="一世长安的博客已经运行 "+daysold+" 天 "+hrsold+" 小时 "+minsold+" 分 "+seconds+" 秒";
      }
      show_date_time();
    </script>
    </div>
    <script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js">
</script>
</section>
```

## 如何去掉博客底部的 由Hexo强力驱动...
找到文件 ``next/layout/_partials/footer.swig``
将下面代码删除即可：
```shell

{% if theme.footer.powered %}
  <div class="powered-by">{#
  #}{{ __('footer.powered', '<a class="theme-link" target="_blank" href="https://hexo.io">Hexo</a>') }}{#
#}</div>
{% endif %}

{% if theme.footer.powered and theme.footer.theme.enable %}
  <span class="post-meta-divider">|</span>
{% endif %}

{% if theme.footer.theme.enable %}
  <div class="theme-info">{#
  #}{{ __('footer.theme') }} &mdash; {#
  #}<a class="theme-link" target="_blank" href="https://github.com/iissnan/hexo-theme-next">{#
    #}NexT.{{ theme.scheme }}{#
  #}</a>{% if theme.footer.theme.version %} v{{ theme.version }}{% endif %}{#
#}</div>
{% endif %}
```

## 添加萌妹纸
1. 安装代码：
``` shell
npm install --save hexo-helper-live2d
```
2. 相应配置代码如下：
```shell
live2d:
  enable: true
  scriptFrom: local
  model:
    use: live2d-widget-model-wanko
  display:
    position: right
    width: 150
    height: 300
  mobile:
    show: true
```
注：萌妹纸功能是集成在 ``yilia`` 主题中的，``next`` 主题我还没发现有这个功能，所以如果使用的话，确实会有一个可爱的萌妹纸出现在你的网页上，但是：你用代码控制不了她(比方说妹纸的人选、大小、位置等)。

## 参考链接
参考链接1：(https://asdfv1929.github.io/)
参考链接2：(http://www.aisun.org/2017/10/hexo-next+dingzhi/)