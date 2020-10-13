//
//  LocalWebViewController.m
//  LearningCodes
//
//  Created by Tony Lee on 2020/9/24.
//  Copyright © 2020 Tony. All rights reserved.
//

#import "LocalWebViewController.h"
#import <WebKit/WKWebView.h>

@interface LocalWebViewController () <WKUIDelegate, WKNavigationDelegate>

@end

@implementation LocalWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *localHTML = @"\n<p>1991 年，处于世纪之交的计算机学家马克·维瑟（Mark·Weiser）发表了一篇名为《21 世纪的计算机》的文章，其中提到了一个新概念——普适计算。</p>\n<p>普适计算强调计算机将融于网络、融于环境、融于生活，它应该无处不在、又让人意识不到，就像我们看到指路牌不会去思考指路牌是什么，而是直接看指路牌上的文字，计算机应该是「无感」的，人们不用思考而能直接使用。</p>\n<p><img class=\"alignnone size-full wp-image-1368878\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/suganth-l2mIRNeGWoA-unsplash-1.jpg!720\" alt=\"\" width=\"1920\" height=\"1280\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/suganth-l2mIRNeGWoA-unsplash-1.jpg!720 1920w, https://s3.ifanr.com/wp-content/uploads/2020/09/suganth-l2mIRNeGWoA-unsplash-1-360x240.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/suganth-l2mIRNeGWoA-unsplash-1-768x512.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/suganth-l2mIRNeGWoA-unsplash-1-1024x683.jpg 1024w\" sizes=\"(max-width: 1920px) 100vw, 1920px\" /></p>\n<p>以如今的眼光来看，普适计算正在逐渐实现，AirPods 就是最典型的案例之一，舒适的佩戴感、没有剪不断理还乱的线材，使用时几乎感受不到它的存在。</p>\n<h3>AirPods ，用起来越来越「无感」了</h3>\n<blockquote><p>新功能的好用，是那种让人感受不到的好用。</p></blockquote>\n<p>拥有 MacBook Pro、iPad、AirPods Pro 等多款苹果设备的同事，在体验 AirPods 的新功能「<a href=\"https://www.ifanr.com/app/1365858\">自动切换」</a>后，如是向我说到。</p>\n<p><img class=\"alignnone size-full wp-image-1368879\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/Muse-AirPods-24-1.jpg!720\" alt=\"\" width=\"3000\" height=\"1688\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/Muse-AirPods-24-1.jpg!720 3000w, https://s3.ifanr.com/wp-content/uploads/2020/09/Muse-AirPods-24-1-360x203.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/Muse-AirPods-24-1-768x432.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/Muse-AirPods-24-1-1024x576.jpg 1024w\" sizes=\"(max-width: 3000px) 100vw, 3000px\" /></p>\n<div class=\"editor-image-source\">\n<p>▲ 自动切换功能需要更新到 iOS 14/iPadOS 14 和 macOS Big Sur 系统。</p>\n</div>\n<p>自动切换功能是苹果最近为 AirPods 产品线带来的两项新功能之一，AirPods  和 AirPods Pro 均支持。戴上 AirPods 之后，用户可以在 iPhone、iPad、Mac 间无缝切换。</p>\n<p>举个例子，在 iPhone 上听完歌之后，后期同事把成稿片子发到我的 Mac 上，当我打开视频时，AirPods Pro 会自动连接到电脑播放视频。</p>\n<p>取下耳机之后，视频又会自动暂停播放。</p>\n<p><img class=\"alignnone size-full wp-image-1368882\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/jens-kreuter-ngMtsE5r9eI-unsplash.jpg!720\" alt=\"\" width=\"1920\" height=\"1079\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/jens-kreuter-ngMtsE5r9eI-unsplash.jpg!720 1920w, https://s3.ifanr.com/wp-content/uploads/2020/09/jens-kreuter-ngMtsE5r9eI-unsplash-360x202.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/jens-kreuter-ngMtsE5r9eI-unsplash-768x432.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/jens-kreuter-ngMtsE5r9eI-unsplash-1024x575.jpg 1024w\" sizes=\"(max-width: 1920px) 100vw, 1920px\" /></p>\n<p>这期间不需要在 Mac 上对 AirPods Pro 进行任何设置，一切都是那么流畅、便利，整个过程中几乎感受不到耳机的存在或变动。</p>\n<p>而另一个新功能则是空间音频，和「自动切换」一样，它也是体验上的提升。目前仅 AirPods Pro 可使用该功能，实际体验和环绕立体声类似，开启后，无论脑袋怎么移动，仍然会感受到声音从播放设备（iPhone）的方向发出，沉浸感大大增强。</p>\n<p>此前提供该功能的产品大多都是专业游戏耳机，像是 JBL Quantum ONE、HyperX Cloud Orbit S 等，连接 PC 后，它们可以模拟提空类似环绕立体声的效果，对于强调环境变化的大型游戏来说，更立体的声音也是游戏体验中重要的一环。</p>\n<p><img class=\"alignnone size-full wp-image-1368885\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/EmESXUwZtPmrkrgPdodT9T-970-80.jpg!720\" alt=\"\" width=\"970\" height=\"545\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/EmESXUwZtPmrkrgPdodT9T-970-80.jpg!720 970w, https://s3.ifanr.com/wp-content/uploads/2020/09/EmESXUwZtPmrkrgPdodT9T-970-80-360x202.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/EmESXUwZtPmrkrgPdodT9T-970-80-768x432.jpg 768w\" sizes=\"(max-width: 970px) 100vw, 970px\" /></p>\n<p>半入耳式设计、不到 5g 的重量，再加上苹果对 AirPods 外形 ID 的调整，以求适应绝大部分的耳道，佩戴起来几乎没有「异物感」，这也是很多人感觉 AirPods 佩戴无感的原因。</p>\n<p>而自动切换和空间音频则进一步将实际体验拉升了一个层次，更为重要的是，我们在这期间几乎感受不到 AirPods 这台「微型计算机」的存在。</p>\n<p>AirPods ，几乎完美符合马克·维瑟所阐述的普适计算理论。</p>\n<p>这份几乎无感的使用体验，促进真无线耳机品类火爆的同时，也改变了它与我们的交互方式，听是一种交互、戴上和放下是一种，甚至于说话也是。通过 AirPods ，我们正在和它本身互动，或是以它为桥和更多设备互动。</p>\n<p><img class=\"alignnone size-full wp-image-1368886\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/home.jpg!720\" alt=\"\" width=\"1600\" height=\"1188\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/home.jpg!720 1600w, https://s3.ifanr.com/wp-content/uploads/2020/09/home-360x267.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/home-768x570.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/home-1024x760.jpg 1024w\" sizes=\"(max-width: 1600px) 100vw, 1600px\" /></p>\n<p>和它本身互动比较好理解，这是耳机这一品类的老本行了，而以它为桥往往指的是通过 AirPods 和苹果设备乃至智能家居等设备交互。</p>\n<p>得益于 Siri 功能的加入，AirPods 可以通过语音交互操控智能家居，相比其他语音指令，智能家居则更简单，像开灯、关灯这些都是类似按钮开关的指令，复杂一点的设置空调也就是类似旋钮的指令。</p>\n<p>更为复杂的「电影模式」，即一次性调整窗帘、灯光等，仍然还是在传统的与或非开关逻辑内。</p>\n<p><img class=\"alignnone size-full wp-image-1368888\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/karim-manjra-pWlM5L6PFis-unsplash.jpg!720\" alt=\"\" width=\"1920\" height=\"1298\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/karim-manjra-pWlM5L6PFis-unsplash.jpg!720 1920w, https://s3.ifanr.com/wp-content/uploads/2020/09/karim-manjra-pWlM5L6PFis-unsplash-360x243.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/karim-manjra-pWlM5L6PFis-unsplash-768x519.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/karim-manjra-pWlM5L6PFis-unsplash-1024x692.jpg 1024w\" sizes=\"(max-width: 1920px) 100vw, 1920px\" /></p>\n<div class=\"editor-image-source\">\n<p>▲ 智能家居替代部分传统开关</p>\n</div>\n<p>虽然 Siri 常常被吐槽不够智能，但它对于一些简单的开关指令还是能执行的比较好，除了智能家居，Siri 也是视障人士的好帮手，毕竟手机功能越来越复杂、功能层级也越来越多，用语音反而来的更方便，其底层逻辑和智能家居开关是一样的。</p>\n<p>到这里你可能会疑问，这些事智能音箱也能做，为什么要用真无线耳机？</p>\n<p>我们在之前的<a href=\"https://www.ifanr.com/1287005\">文章</a>中也讨论了这个话题，一方面是因为真无线耳机更轻巧、便携，也就是上文所述的「无感」化体验，另一方面则是真无线耳机贴近耳朵，操控方便而且具备私密性，这些都是智能音箱不具备的。</p>\n<p><img class=\"alignnone size-full wp-image-1368890\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/andres-urena-tsBropDpnwE-unsplash.jpg!720\" alt=\"\" width=\"1920\" height=\"1280\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/andres-urena-tsBropDpnwE-unsplash.jpg!720 1920w, https://s3.ifanr.com/wp-content/uploads/2020/09/andres-urena-tsBropDpnwE-unsplash-360x240.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/andres-urena-tsBropDpnwE-unsplash-768x512.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/andres-urena-tsBropDpnwE-unsplash-1024x683.jpg 1024w\" sizes=\"(max-width: 1920px) 100vw, 1920px\" /></p>\n<p>AirPods 们现在成为了智能家居等物联网设备的入口之一。</p>\n<p>除了和硬件产品协作交互，AirPods 所改变的耳机交互方式，也影响了软件生态，现在，你能看到越来越多针对音频设计的 app 了。</p>\n<h3>真无线耳机的普及，推动了音频 app 增长</h3>\n<p>根据 IDC 发布的数据<a href=\"https://www.idc.com/getdoc.jsp?containerId=prCHC46828720\">报告</a>，2020 年上半年中国无线耳机市场出货量为 4,256 万台，同比增长 24%。其中真无线耳机占比 64%，同比增长 49%。苹果在国内无线耳机市场份额是 18.1%，其他份额则被小米、华为、漫步者等厂商瓜分。</p>\n<p>真无线耳机已经成为了继智能手机市场之后，又一个快速发展的硬件品类，而作为这一品类的开创者，AirPods 受到的关注自然是最多，此前就有 AirPods 爱好者为它建立了一个名为 AirPods App Store 的<a href=\"https://www.airpodsappstore.com/\">网站</a>。</p>\n<p><img class=\"alignnone size-full wp-image-1368892\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/2321.png!720\" alt=\"\" width=\"2462\" height=\"1344\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/2321.png!720 2462w, https://s3.ifanr.com/wp-content/uploads/2020/09/2321-360x197.png 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/2321-768x419.png 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/2321-1024x559.png 1024w\" sizes=\"(max-width: 2462px) 100vw, 2462px\" /></p>\n<div class=\"editor-image-source\">\n<p>▲ AirPods App Store 网站的一角</p>\n</div>\n<p>当然，这并不是由苹果官方建立的 App Store，而是 AirPods 爱好者们定期收集 App Store 中适用于 AirPods 的软件应用，虽然规模不大，但却各有特色。</p>\n<p>例如工具应用 Yac，和主流的视频会议软件不同，在这个软件中每一次会谈被称为一次 Yac ，而每次 Yac 的限制时间为 120 秒，这就要求发送者对发送内容深思熟虑，逻辑清晰。</p>\n<p><img class=\"alignnone size-full wp-image-1368893\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/23213.png!720\" alt=\"\" width=\"1474\" height=\"1078\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/23213.png!720 1474w, https://s3.ifanr.com/wp-content/uploads/2020/09/23213-360x263.png 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/23213-768x562.png 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/23213-1024x749.png 1024w\" sizes=\"(max-width: 1474px) 100vw, 1474px\" /></p>\n<p>这种限制时间的语音机制，对于成员分散在各个时区的团队来说很方便，不需要开会双方同时在白天沟通。Yac 宣称自己是 zoom 的替代者，它认为视频会议长期都存在低效、拖沓的问题，而使用限制性的音频能有效提高效率。</p>\n<p>另一个热门类别是音频社交，Cappucino.fm 是一个语音社交应用，用户可以使用它录制一小段音频，而系统会为其配上音乐，让这段音频更有趣。</p>\n<p>更为知名的语音社交应用是 clubhouse，这款在内测期间的产品引起了硅谷科技圈的注意，甚至有投资人愿意给它投资 1000 万美金，而据纽约时报<a href=\"https://www.nytimes.com/2020/05/19/technology/clubby-silicon-valley-app-clubhouse.html\">报道</a>，其曾被估值超过 1 亿美元。</p>\n<p><img class=\"alignnone size-full wp-image-1368896\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/v2_a7a15e145870402bbd60b33403de1011_img_jpg.jpeg!720\" alt=\"\" width=\"1390\" height=\"751\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/v2_a7a15e145870402bbd60b33403de1011_img_jpg.jpeg!720 1390w, https://s3.ifanr.com/wp-content/uploads/2020/09/v2_a7a15e145870402bbd60b33403de1011_img_jpg-360x195.jpeg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/v2_a7a15e145870402bbd60b33403de1011_img_jpg-768x415.jpeg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/v2_a7a15e145870402bbd60b33403de1011_img_jpg-1024x553.jpeg 1024w\" sizes=\"(max-width: 1390px) 100vw, 1390px\" /></p>\n<p>就功能玩法上来说，clubhouse 与现在大部分的社交应用不同，它是一款以音频为主的应用，用户可以选择感兴趣的话题，进入相应的房间进行语言聊天。</p>\n<p>国内也有类似的音频应用的，果壳出品的「递爪」就是其中之一，进入递爪完成基本的测试后，系统会为用户推荐部分聊天室，用户也可以自己选择符合兴趣的进入。</p>\n<p><img class=\"alignnone size-full wp-image-1368904\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3724.jpeg!720\" alt=\"\" width=\"1656\" height=\"1792\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3724.jpeg!720 1656w, https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3724-360x390.jpeg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3724-768x831.jpeg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3724-946x1024.jpeg 946w\" sizes=\"(max-width: 1656px) 100vw, 1656px\" /></p>\n<div class=\"editor-image-source\">\n<p>▲ 递爪 app</p>\n</div>\n<p>除了果壳，语音社交这条赛道上选手并不少，腾讯曾推出主打真人语音社交的应用「回音」， 2019 年的大热语音社交产品音遇、吱呀都曾闯入 App Store 排行榜前五。</p>\n<p>无论是 AirPods App Store 还是语音社交的火热，都是近几年才出现的，这背后和真无线耳机产品的普及有着不小的关系。</p>\n<p>我们和耳机交互方式的改变，是音频介质能被开发者们关注，展现更多创意、玩法的重要原因之一。</p>\n<h3>AirPods 革新了耳机的交互方式</h3>\n<p>在 AirPods 之前，耳机作为一款单纯的音频设备，人机交互方式主要是听，人作为接受端，接受耳机所传输的信息，所以传输信息的质量、准确度是人们一直以来最为关注的标准。</p>\n<p><img class=\"alignnone size-full wp-image-1368897\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/tamas-pap-pqMG6qAEZY4-unsplash.jpg!720\" alt=\"\" width=\"1920\" height=\"1501\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/tamas-pap-pqMG6qAEZY4-unsplash.jpg!720 1920w, https://s3.ifanr.com/wp-content/uploads/2020/09/tamas-pap-pqMG6qAEZY4-unsplash-360x281.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/tamas-pap-pqMG6qAEZY4-unsplash-768x600.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/tamas-pap-pqMG6qAEZY4-unsplash-1024x801.jpg 1024w\" sizes=\"(max-width: 1920px) 100vw, 1920px\" /></p>\n<p>而在 AirPods 之后，这一切在逐渐发生改变，AirPods 和我们的交互方式变成双向了，输入与输出可以同时进行。</p>\n<p>回顾 AirPods 的发展史就能发现，苹果革新了耳机这一品类的同时，也改变耳机的交互方式，初代 AirPods 上 W1 芯片和而后更新的 H1 芯片，极大地降低了耳机连接不畅、延迟高的问题。</p>\n<p>再加上 AirPods 内运动加速器、光学传感器等大量传感器，让它能和苹果生态内的设备无缝联动，匹配连接、音频信息输出与输入，不需要再人为操作，一切都在不知不觉中完成。</p>\n<p><img class=\"alignnone size-full wp-image-1368898\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/kal-visuals-rvBPaAwHMS8-unsplash.jpg!720\" alt=\"\" width=\"1920\" height=\"1280\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/kal-visuals-rvBPaAwHMS8-unsplash.jpg!720 1920w, https://s3.ifanr.com/wp-content/uploads/2020/09/kal-visuals-rvBPaAwHMS8-unsplash-360x240.jpg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/kal-visuals-rvBPaAwHMS8-unsplash-768x512.jpg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/kal-visuals-rvBPaAwHMS8-unsplash-1024x683.jpg 1024w\" sizes=\"(max-width: 1920px) 100vw, 1920px\" /></p>\n<p>而后 Siri 功能的加入，更是大大扩展了 AirPods 可联动的设备范围，从智能门锁、灯具、开关，到智能窗帘等囊括了大量智能家居设备。AirPods App Store 网站的出现，也进一步证明了 AirPods 改变了我们与耳机这一产品的人机交互方式。</p>\n<p>尽管 AirPods 还是会存在电池容量不高、Siri 语音助手不够智能的情况，但它已经做到太多了之前耳机所不能做到的事，像说句话就关灯这种事之前还只是出现科幻电影当中。</p>\n<p>而且，如今入局真无线耳机厂商并不止苹果一家，包括华为、OPPO 、小米、vivo 等主流手机厂商在内，基本都推出了真无线耳机产品，在电商 app 上搜索真无线耳机，价位段从百元到千元，都有。</p>\n<p><img class=\"alignnone size-full wp-image-1368900\" src=\"https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3698-1.jpeg!720\" alt=\"\" width=\"1656\" height=\"1792\" srcset=\"https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3698-1.jpeg!720 1656w, https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3698-1-360x390.jpeg 360w, https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3698-1-768x831.jpeg 768w, https://s3.ifanr.com/wp-content/uploads/2020/09/IMG_3698-1-946x1024.jpeg 946w\" sizes=\"(max-width: 1656px) 100vw, 1656px\" /></p>\n<div class=\"editor-image-source\">\n<p>▲ 在电商平台上搜索「真无线耳机」，能看到多个品牌、不同价位段的产品</p>\n</div>\n<p>除 AirPods，其他厂商的使用体验也在逐渐跟上，市面上延迟抵于 100 ms 的真无线耳机并不少见，OPPO 此前还在亚洲蓝牙耳机展演讲中表示，将发力空间音效等领域。</p>\n<p>AirPods 已经不单单是一款音频设备了，几乎无感的体验让它获得用户认可的同时，也改变了交互方式。就像当初 GUI 和鼠标改变了电脑的人机交互方式一样，这种改变不仅仅带来了体验上的提升，更拓宽了真无线耳机的能力范围，它的形态和功能不正如科幻电影中的未来耳机吗？</p>\n<p>题图来自：Unsplash</p>\n";
    
//    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"localHTML.css" ofType:nil];
//    NSURL *cssURL = [NSURL fileURLWithPath:cssPath];
//    NSLog(@"%@", cssURL);
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"LearningHTML.html" ofType:nil];
    NSString *htmlStr = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    
    NSMutableString *headHTML = [NSMutableString stringWithCapacity:100];
    [headHTML appendString:@"<html><head>"];
    [headHTML appendString:@"<meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'>"];
    [headHTML appendString:@"<meta name='apple-mobile-web-app-capable' content='yes'>"];
    [headHTML appendString:@"</head>"];
    
    
    NSMutableString *showHTML = [NSMutableString stringWithCapacity:100];
//    [showHTML appendString:headHTML];
//    [showHTML appendString:@"<body>"];
//    [showHTML appendString:@"<script type='text/javascript'>"
//     "window.onload = function() {\n"
//     "var maxWidth = document.body.clientWidth;\n"
//     "for (i = 0; i < document.images.length; i++) {\n"
//     "var myImg = document.images[i];\n"
//     "if (myImg.width > maxWidth) {\n"
//     "myImg.style.width = '100%';\n"
//     "myImg.style.height = 'auto';\n"
//     "}\n"
//     "}\n"
//     "}\n"
//     "</script>\n"];
//    [showHTML appendString:localHTML];
//    [showHTML appendString:@"</body>"];
//    [showHTML appendString:@"</html>"];
    
    NSString *htmlBodyPath = [[NSBundle mainBundle] pathForResource:@"HTMLBody" ofType:nil];
    NSString *htmlBody = [NSString stringWithContentsOfFile:htmlBodyPath encoding:NSUTF8StringEncoding error:nil];
    NSString *headerStr = @"<!DOCTYPE html><html><head><meta name='viewport' content='width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no'>";
    
    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"style.css" ofType:nil];
    NSString *cssStr = [NSString stringWithContentsOfFile:cssPath encoding:NSUTF8StringEncoding error:nil];
    NSMutableString *header = [NSMutableString stringWithCapacity:100];
    [header appendString:headerStr];
    [header appendString:@"<style type='text/css'>"];
    [header appendString:cssStr];
    [header appendString:@"</style>"];
    [header appendString:@"</header>"];
    
    [showHTML appendString:header];
    [showHTML appendString:htmlBody];
    [showHTML appendString:@"</html>"];
    
    NSLog(@"%@", showHTML);
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    [webView loadHTMLString:showHTML baseURL:nil];
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'";
    [webView evaluateJavaScript:str completionHandler:nil];
}



@end
