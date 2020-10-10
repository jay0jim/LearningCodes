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
    
    NSString *localHTML = @"<div class=\"main-wrap content-wrap\">\n<div class=\"headline\">\n\n<div class=\"img-place-holder\"></div>\n\n\n\n</div>\n\n<div class=\"content-inner\">\n\n\n\n<div class=\"question\">\n<h2 class=\"question-title\">假如长颈鹿不吃树叶改吃草，它的脖子可能还是这么长</h2>\n<div class=\"answer\">\n\n<div class=\"meta\">\n<img class=\"avatar\" src=\"https://pic1.zhimg.com/v2-7215d0e6018a0ed37f0aa2edfb071310_l.jpg?source=8673f162\">\n<span class=\"author\">SME情报员，</span><span class=\"bio\">讲讲科学史，聊聊科学家，挖挖冷知识（公众号：SME科技故事）</span>\n</div>\n\n<div class=\"content\">\n<p>高中生物课本中达尔文的进化论常以长颈鹿作为例子，阐述了长脖子能吃到树冠上的树叶，而短脖子因够不着而饿死，最终在自然选择下，长脖子的长颈鹿得以生存进化的道理。</p>\r\n<p class=\"ztext-empty-paragraph\">然而，<strong>通过食物的获得而受到自然选择，或许并不是长颈鹿拥有长脖子的原因。</strong></p>\r\n<figure><img class=\"content-image\" src=\"https://pic3.zhimg.com/v2-a5dc935fd7de5e03f8ce1e18594f6178_b.jpg\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">傲居群雄的身高和独特的身材比例让长颈鹿的脖子成为这一物种最显著的标志。<br><br><strong>长颈鹿作为陆地上最高的动物。</strong>它不仅吸引了人们观赏的眼球。也引得动物学家们前仆后继的观察与探究。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic3.zhimg.com/v2-3406b92ff8a1125199b1c9ea75e7f726_b.gif\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">修长的脖子和四肢使长颈鹿拥有约 5 米的高挑身躯。<strong>然而与人类相同，长颈鹿的颈骨也只有 7 块。</strong>腿部骨骼的数量也没有特别的增多。只是骨骼的纵向长度被基因决定而得到延长。每块颈骨都增长到了大约 30 厘米。</p>\r\n<p class=\"ztext-empty-paragraph\">而粗壮的骨骼也需要骨头关节间产生更多的关节粘液。<strong>因此骨头与骨头之间的关节变得十分有弹性。</strong></p>\r\n<p class=\"ztext-empty-paragraph\">这么看来，长颈鹿似乎并不会像人类一样受到关节炎的困扰。<br><br>它们的脖子也因此得以扭动自如。<strong>在战斗中，把灵活的脖子和坚硬的头颅当作流星锤，对敌人发起猛烈撞击。</strong></p>\r\n<figure><img class=\"content-image\" src=\"https://pic4.zhimg.com/v2-3f0eaaccb47f289c6e13b5d340115dbd_b.jpg\" alt=\"\"><figcaption>骨骼构造</figcaption></figure><p class=\"ztext-empty-paragraph\">然而看似优越的器官其实给长颈鹿带来不小的生存负担。</p>\r\n<p class=\"ztext-empty-paragraph\">纤长的四肢和脖子让长颈鹿饮水问题成为一大障碍。<strong>它们通常需要以类似劈叉的姿势岔开前肢，才能把头低下够着河水。</strong>45～50 厘米的长舌头在这时候也助了它一臂之力。<br><br>然而，这种姿态下的长颈鹿一旦不幸遭受狮子等野兽的袭击。它们几乎来不及反应，调整奔跑姿态进行逃生。<br><br>丛林中最高挑的物种就这样落入迅猛之口。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic2.zhimg.com/v2-1245c4c08f0b4568d4abf8ab443fd111_b.gif\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">就以人体的身躯来说，在高原地带都常出现供氧不足的情况。这主要是由于心脏没能将充足的氧气随血液供应给大脑使用。</p>\r\n<p class=\"ztext-empty-paragraph\">而长颈鹿的脖子虽然为它赢得高傲的尊严。<strong>它却使头颅与心脏分隔开超过两米的距离。</strong><br><br>为了让血液从低处的心脏一泵而起抵达大脑，它必须具有强悍的心血管系统来完成这一艰巨使命。<br><br><strong>因此它们发育出动物界中最强壮的心脏，重量达到 12 千克。</strong>在动力十足的心脏作用下，它们的血压和收缩压达到了人类的 2.5 倍。</p>\r\n<p class=\"ztext-empty-paragraph\">而为了使极速迸发的血液稳固地在血管里驰骋，它们的动脉内部也具有特殊的支撑结构。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic3.zhimg.com/v2-d589456968bc586fb9268655fa35809f_b.jpg\" alt=\"\"><figcaption>长颈鹿的心血管系统</figcaption></figure><p class=\"ztext-empty-paragraph\">而关于长颈鹿的脖子为何这么长的疑惑一直存在于人们心中。<br><br>也许好奇心是人类的本性，挖掘新奇背后的本质也是本能所驱使。于是一套又一套的研究理论体系重复上演着提出、质疑、推翻的戏码。<br><br>1809 年，法国动物学家拉马克第一次对长颈鹿的长脖子。<strong>他从长颈鹿进食的角度出发，做出“用进废退”的理论解释。</strong>他认为它们为了取食高处的树叶而不断锻炼颈部肌肉，从而得到越来越长的脖子。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic1.zhimg.com/v2-77fdcdadde4b6dcdb6814066ec440fd3_b.jpg\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\"> <br><br>而正如我们所熟悉的，他的观点被达尔文质疑和反驳。</p>\r\n<p class=\"ztext-empty-paragraph\"><strong>时隔半个多世纪后，达尔文在其著作《物种起源》的第六版中提出了更具有说服力的论断。</strong>他认为一代物种中的器官显著变化难以实现。</p>\r\n<p class=\"ztext-empty-paragraph\">于是他从进化的角度，论述了长脖子的长颈鹿因容易取食而存活下来，短脖子则会被饿死。因而长脖子基因得以在自然选择的优胜劣汰规律中延续。</p>\r\n<p class=\"ztext-empty-paragraph\">但他依旧是围绕长颈鹿获取食物的方向进行理论修正。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic2.zhimg.com/v2-da7aadad8a54929e6f546dffd41e5881_b.jpg\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">当人们广泛接受了达尔文的观点，普遍认同长颈鹿在食物的自然选择下进化出修长的脖子。</p>\r\n<p class=\"ztext-empty-paragraph\">其实关于长颈鹿脖子的研究并没有走到终点。一些陆续提出的反对声音不绝如缕。<br><br><strong>然而公众的意识已经被潜移默化地根植于固有的理论。</strong>再有新的观念输入也变得困难，即使合理性略胜一筹。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic2.zhimg.com/v2-d105ce0fd542e599259e70068aed867c_b.jpg\" alt=\"\"><figcaption>达尔文《物种起源》 </figcaption></figure><p class=\"ztext-empty-paragraph\"><strong>1996 年，罗伯特·西蒙斯和卢·希培斯提出了不同的观点。</strong><br><br>他们同意长颈鹿的长脖子是在自然选择下进化而来的。但是却认为达尔文等人以食物摄取作为选择因素的判断着实站不住脚根。<br><br>通过长时间对野外长颈鹿生活的观察，他们探寻出了一些规律。<br><br><strong>长颈鹿群体中在身高上表现出了明显的性别二态性。</strong>雄性长颈鹿的身高一般能达到 4.8～5.5 米。而雌性长颈鹿通常身高只有 4 米出头。<br><br>这是因为雌性往往十岁之后便不再长高，而雄性通常能长到二十多岁。<br><br><strong>因此雌性长颈鹿也只能取食于相对较矮的树木。</strong></p>\r\n<figure><img class=\"content-image\" src=\"https://pic4.zhimg.com/v2-8d8c1a3db3f6500bab1eff9920c3754e_b.jpg\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">他们还发现，在非洲地区干旱的季节里，种群之间觅食竞争激烈。<strong>但在这种情况下，长颈鹿却大多以低矮的灌木丛为食，并非高大的树木。</strong><br><br>而且为了追求进食的速度，它们最常见的进食姿势都是弯曲脖子，低下高贵的头颅。<br><br><strong>也就是说，修长的脖子对于长颈鹿进食非但没有帮助，反而可能是个阻碍。</strong><br><br>因此，西蒙斯和希培斯否定了长脖子基因在食物选择下进化的学说。他们同时观察到，在雄性长颈鹿争夺配偶的过程中，他们往往通过脖子格斗的方式决一胜负。<br><br>而长脖子的长颈鹿在长度和强度上都占据优势，通常能够优先夺得佳人的芳心。</p>\r\n<p class=\"ztext-empty-paragraph\"><strong>于是他们提出，性选择也许才是长脖子基因获得遗传延续的最主要原因。</strong>而按照性选择的观点看来，决定长脖子基因的关键，也依赖于雌性长颈鹿对长颈异性的偏爱。</p>\r\n<figure><img class=\"content-image\" src=\"https://picb.zhimg.com/v2-1b785bd384643b086be7ef69b373e304_b.gif\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">当然这也未必是拍砖定音的结论。性选择的观点也同样面临着质疑与反驳。</p>\r\n<p class=\"ztext-empty-paragraph\">关于长颈鹿长脖子的解释不断涌现出新鲜版本。<strong>却仍然停留在推测、假定的可能性提出阶段，尚未有客观的数据能证明。</strong></p>\r\n<figure><img class=\"content-image\" src=\"https://pic3.zhimg.com/v2-692fa4fcb04a2ba798aea6e3535a1f0b_b.jpg\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">在科研技术水平相对低下的过去，对生物的研究方法无非是驻点观察。这样不仅耗费了生物学家大量的时间精力，也存在极大的偶然几率。所得的研究成果只能归结为假说，很难得到严谨的证实。</p>\r\n<p class=\"ztext-empty-paragraph\">而随着现代研究水平的提高和先进设备的研发。科学研究理论的严谨性和客观性要求也逐渐提高。<strong>如今，科学家们已经开始在假说的基础上展开具体化的研究分析。</strong><br><br>关于长颈鹿长脖子进化的猜测与学说不断更替与覆盖。而最终还是得落实到具象化的分析中去。</p>\r\n<p class=\"ztext-empty-paragraph\">对长颈鹿长脖子基因的推论早见端倪。<strong>而通过基因测序的手段获取长颈鹿进化过程中的基因信息，还是近年来才开展取得的成果。</strong></p>\r\n<figure><img class=\"content-image\" src=\"https://pic4.zhimg.com/v2-9ac35e5ddc876765f7371e3e16282233_b.gif\" alt=\"\"><figcaption>神秘的 DNA</figcaption></figure><p class=\"ztext-empty-paragraph\"><strong>㺢㹢狓是地球上现存两种长颈鹿科动物的另外一种。</strong>它与长颈鹿虽是唯一的近亲，却没有发育出长脖子。<br><br>两者大约在 1100～1200 万年前由共同的祖先向两个方向演变成不同的物种。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic4.zhimg.com/v2-07edade751fdb8e9b5efddda80da7dd5_b.jpg\" alt=\"\"><figcaption>比起长颈鹿，㺢㹢狓长得更像斑马</figcaption></figure><p class=\"ztext-empty-paragraph\">在非洲大陆上的大象、狮子纷纷完成了基因测序之后。2016 年，切尔西等人终于把这项技术运用到疑团重重的长颈鹿身上。</p>\r\n<p class=\"ztext-empty-paragraph\"><strong>他们对长颈鹿的基因组进行了测序工作。</strong>并与㺢㹢狓及其它 40 多种哺乳动物的基因进行对比分析。<br><br>目前研究发现，长颈鹿中确定了 70 个基因表现出多种适应性进化。其中 2/3 的基因在调节骨骼、心血管等生理方面具有特定作用。<strong>这也就证明了，它们的脖子是在进化过程中适应环境而逐渐得到演变。</strong></p>\r\n<p class=\"ztext-empty-paragraph\">虽然这样的假说早已被人们看作理所当然。但真正从基因层面作出解释，才具有了理论说服力。<br><br>虽然基因测序的方法也尚未揭开长颈鹿的奥秘。<strong>但这毕竟是从猜想到理论证明过渡的质的飞跃。</strong>科学研究道路上的每一步，都是科学家们的艰难跨越。</p>\r\n<figure><img class=\"content-image\" src=\"https://pic3.zhimg.com/v2-701c07351b3d74eb8d231df70c0852ed_b.jpg\" alt=\"\"></figure><p class=\"ztext-empty-paragraph\">因此，对于长颈鹿脖子为何这么长的问题，目前只有一个严谨的回答：“不知道”。<br><br>而正是未知领域的空白与缺失吸引着人们去填充完整。生物界的宽泛与深邃是人类科学难以全面覆盖的，但自然界的万物发展总归有一个合理的解释。</p>\r\n<p class=\"ztext-empty-paragraph\"><strong>寻求真理的欲望与思考驱使着人们不断置疑、挖掘与探索。</strong><br><br><em>* 参考资料</em><br><br><em>长颈鹿. 维基百科.</em><br><br><em>Henry Nicholls. Giraffes maynot have evolved long necks to reach tall trees. BBC. 2016.</em><br><br><em>Simmons R E, Scheepers L. Winning by a Neck: Sexual Selection in theEvolution of Giraffe[J]. American Naturalist, 1996, 148(5):771-786.</em><br><br><em>Agaba M, Ishengoma E, Miller W C, et al. Giraffe genome sequence revealsclues to its unique morphology and physiology[J]. Nature Communications, 2016,7:11519.</em></p>\n\n<div class=\"view-more\"><a href=\"https://zhuanlan.zhihu.com/p/41346708\">查看知乎讨论</a></div>\n\n</div>\n</div>\n</div>\n\n\n</div>\n</div><script type=“text/javascript”>window.daily=true</script>";
    
//    NSString *cssPath = [[NSBundle mainBundle] pathForResource:@"localHTML.css" ofType:nil];
//    NSURL *cssURL = [NSURL fileURLWithPath:cssPath];
//    NSLog(@"%@", cssURL);
    
    NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"test.html" ofType:nil];
    NSString *htmlStr = [NSString stringWithContentsOfFile:htmlPath encoding:NSUTF8StringEncoding error:nil];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    [self.view addSubview:webView];
    [webView loadHTMLString:htmlStr baseURL:nil];
    
    
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'";
    [webView evaluateJavaScript:str completionHandler:nil];
}



@end
