const ap = new APlayer({
    container: document.getElementById('aplayer'),
    fixed: true,
    autoplay: true,
    volume: 0.5,
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
      },
      {
        name: '演员',
        artist: '薛之谦',
        url: 'http://other.web.rf01.sycdn.kuwo.cn/resource/n1/78/39/495851287.mp3',
        cover: 'http://imge.kugou.com/stdmusic/20150605/20150605091116796204.jpg',
      },
      {
        name: '不完整的旋律',
        artist: '王力宏',
        url: 'http://other.web.ra01.sycdn.kuwo.cn/resource/n2/192/4/26/2673415450.mp3',
        cover: 'http://imge.kugou.com/stdmusic/20160907/20160907184638429200.jpg',
      }
    ]
});
