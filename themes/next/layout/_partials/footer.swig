<div class="copyright">{#
#}{% set current = date(Date.now(), "YYYY") %}{#
#}&copy; {% if theme.footer.since and theme.footer.since != current %}{{ theme.footer.since }} &mdash; {% endif %}{#
#}<span itemprop="copyrightYear">{{ current }}</span>
  <span class="with-love">
    <i class="fa fa-{{ theme.footer.icon }}"></i>
  </span>
  <span class="author" itemprop="copyrightHolder">{{ theme.footer.copyright || config.author }}</span>

  {% if theme.post_wordcount.totalcount %}
    <span class="post-meta-divider">|</span>
    <span class="post-meta-item-icon">
      <i class="fa fa-area-chart"></i>
    </span>
    {% if theme.post_wordcount.item_text %}
      <span class="post-meta-item-text">{{ __('已经写了') }}</span>
    {% endif %}
    <span title="{{ __('总字数') }}">{#
    #}{{ totalcount(site, '0,0.0a') }}{#
  #}</span>
    <span class="post-meta-item-text">{{ __('字啦') }}</span> 
  {% endif %}
</div>


{% if theme.footer.custom_text %}
  <div class="footer-custom">{#
  #}{{ theme.footer.custom_text }}{#
#}</div>
{% endif %}


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
        span_dt_dt.innerHTML="本博客已经开心运行 "+daysold+" 天 "+hrsold+" 小时 "+minsold+" 分 "+seconds+" 秒 ^_^";
      }
      show_date_time();
    </script>
    </div>
    <script async src="//dn-lbstatics.qbox.me/busuanzi/2.3/busuanzi.pure.mini.js">
</script>
</section>