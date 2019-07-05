<%@ page language="java" pageEncoding="GBK"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>个人菜谱 - 美拾</title>
		<link rel="stylesheet" type="text/css" href="css/main.css">
			<link rel="stylesheet" type="text/css" href="css/menu_book.css"/>
	</head>

	<body>
		<div class="header"><!--------------头部---------------->
			<div class="conwidth">
				<h1 class="fl"><a href="">美<span>拾</span></a></h1>
				<div class="search fl" id="search-box">
					<form action="#" method="get" target="_blank" >
						<input type="text" placeholder="搜索菜谱、食材"
							id="sreach-input" class="search-text fl"/>
						<input type="button" value="搜菜谱" class="search-btn fl"/>
					</form>
				</div>
				<div class="nav fr">
				<ul>
					<li><a href="index.html">首页</a></li>
					<li class="menu-class"><a href="menu_class.html">菜谱分类</a>
                        <div class="topbar-menu">
                            <ul class="plain">
                            <li class='topbar-menu-head'>常用主题</li>
                            <li><a href="menu_class.html" >家常菜</a></li>
                            <li><a href="menu_class.html" >快手菜</a></li>
                            <li><a href="menu_class.html" >下饭菜</a></li>
                            <li><a href="menu_class.html" >早餐</a></li>
                            <li><a href="menu_class.html" >减肥</a></li>
                            <li><a href="menu_class.html" >汤羹</a></li>
                            <li><a href="menu_class.html" >烘焙</a></li>
                            <li><a href="menu_class.html" >小吃</a></li>
                            </ul>
                            <ul class="plain">
                            <li class='topbar-menu-head'>常见食材</li>
                            <li><a href="menu_class.html" >猪肉</a></li>
                            <li><a href="menu_class.html" >鸡肉</a></li>
                            <li><a href="menu_class.html" >牛肉</a></li>
                            <li><a href="menu_class.html" >鱼</a></li>
                            <li><a href="menu_class.html" >鸡蛋</a></li>
                            <li><a href="menu_class.html" >土豆</a></li>
                            <li><a href="menu_class.html" >茄子</a></li>
                            <li><a href="menu_class.html" >豆腐</a></li>
                            </ul>
                            <ul class="plain">
                            <li class='topbar-menu-head'>时令食材</li>
                            <li><a href="menu_class.html" >春笋</a></li>
                            <li><a href="menu_class.html" >笋</a></li>
                            <li><a href="menu_class.html" >豌豆</a></li>
                            <li><a href="menu_class.html" >草莓</a></li>
                            <li><a href="menu_class.html" >金桔</a></li>
                            <li><a href="menu_class.html" >菠菜</a></li>
                            <li><a href="menu_class.html" >冬笋</a></li>
                            <li><a href="menu_class.html" >韭菜</a></li>
                            </ul>
                            <div class="span">
                            <span><a href="menu_class.html">查看全部分类</a></span>
                            </div>
                        </div>
                    </li>
					<li><a href="popular_menu.html">菜单</a></li>
					<li><a href="">作品动态</a></li>
				</ul>
				<div class="dengluzhuce fr">
					<a href=login.html"">登录</a>
					<a href="register .html">注册</a>
				</div>
				</div>
			</div>
            <div class="suggest" id="sreach-suggest"><!---搜索智能提示suggest-->
                <ul>
                    <li>搜"  "相关用户</li>
                    <li>搜"  "相关菜单</li>
                </ul>
            </div>
        </div>
        <div class="konghang"></div><!--因为头部固定而需要设置高度空行把内容撑下去-->


		<div class="conwidth content clearfix">
			<h1>松子蒜蓉鸡便当<i></i></h1>
			<div class="leftcon">
				<img src="img/menubook/745c4c122aea11e7947d0242ac110002_1536w_1024h.jpg"/>
				<div class="cookde">
					<span class="cooknum">0</span><span>&nbsp;人做过这道菜</span>
					<div class="fr">
						<a href="#" title="添加到菜单" class="icon"></a><a class="shoucang">收藏</a>
					</div>
				</div>
				<div class="author">
					<img src="img/menubook/cd9d547428ab11e7947d0242ac110002_271w_209h.jpg"/><span>食在心安</span>
				</div>
				<div class="desc">
					<p>多年前跟一位铁板烧师傅学的一道家常菜。先将去骨鸡腿干煎到表面金黄，分切成适口大小之后，再做后续的调味动作。最主要的重点就是干煎鸡腿时的耐心等待，一定要等到一面煎到上色香酥，再翻面。</p><br />
					<p>记得还是厨房新手的时候，我总是在食材下锅后就急着做些什么，要么翻炒，要么翻面移动位置，好像不做这些事情，就不够称职。经过那位铁板烧师傅的提醒，我才恍然大悟，原来很多时候，食材入锅后是需要静置等待的，让热源有足够的时间将食材加热至理想的状态。</p><br />
					<p>使用大量蒜末葱末做佐料的香煎鸡块，用盐简单提味，味道就很浓郁，最后加入烤得香香的松子，在吃的时候，可以额外享受酥脆的口感，香气也更加倍了。</p><br />
				</div>

				<div class="kh30"></div>
				<div class="zuofa">
					<div class="title"><h2 class="fubiaoti">松子蒜香鸡便当的做法</h2></div>
					<ol>
					    <li><span>1</span><p>制作<松子蒜香鸡>：<br>辣椒切圈，松子放入烤箱烘焙。鸡腿去骨，拭干水分。</p></li>
					    <li><span>10</span><p>开始制作<蒜炒豌豆苗>：<br />蒜片冷油下锅，中火慢慢炒香后下豌豆苗，翻炒一会儿，让油脂均匀黏附在食材上，加入适量清水，加盖焖煮至锅缝飘出白烟后，开盖检视蔬菜熟软状态，如已达喜欢的熟度，加盐调味，炒匀即可。</p><img src="img/menubook/bdea7b9a2aec11e7947d0242ac110002_1280w_1024h.jpg" alt=""></li>
					</ol>
				</div>
				<div style="height: 250px;"><!--有个奇怪的bug，所以加个高度修复。-->

				</div>

				<div class="upload">
					上传你做的松子蒜香鸡便当
				</div>
			<div class="kh30"></div>
			<div class="question">
					<div class="title"><h2 class="fubiaoti">松子蒜香鸡便当的答疑</h2></div>
					关于松子蒜香鸡便当的做法还有疑问？ <a href="cook_question.html">提一个问题</a>
			</div>
			<div class="kh30"></div>
			</div>
			<div class="rightcon">
				<div class="classplace">
					<div class="title"><h2 class="fubiaoti">松子蒜香鸡便当所在分类</h2></div>
					<p>便当</p>
				</div>
				<div class="kh30"></div>
				<div class="recommendedmenu">
					<div class="title"><h2 class="fubiaoti">还没有菜单推荐这个菜谱</h2><a href="">+加入菜单</a></div>
				</div>
				<div class="kh30"></div>
				<div class="look">
					<div class="title"><h2 class="fubiaoti">随便看看</h2></div>
					<span><a href="#">花生仁拌芹菜</a></span><span><a href="#">口袋三明治</a></span>
					<span><a href="#">干锅有机花菜</a></span><span><a href="#">巧克力派</a></span>
					<span><a href="#">香菇红烧鸡块</a></span><span><a href="#">木耳烧腐竹</a></span>
					<span><a href="#">面筋粉面筋</a></span><span><a href="#">紫菜肉片汤</a></span>
					<span><a href="#">腐乳烧肉</a></span><span><a href="#">素炒蘑菇</a></span>
				</div>
				<div class="kh30"></div>
				<div class="erweimaimg">
					<img src="img/menubook/erweima.png" alt="">
				</div>
				<div class="kh30"></div>
				<div class="message">
					<p>该菜谱创建于 2017-04-25</p>
					<p><span>26</span>收藏</p>
					<p>版权归作者所有，没有作者本人的书面许可任何人不得转载或使用整体或任何部分的内容。 </p>
				</div>
			</div>


		</div>

		<div class="bottomcon">
			<div class="conwidth">
				<div class="kh30"></div>
				<div class="alsolike">
					<div class="title"><h2 class="fubiaoti">喜欢松子蒜香鸡便当的也喜欢</h2></div>
						<div class="likemenu">
							<a href="#">
								<img src="img/menubook/56f12d74883211e6b87c0242ac110003_2448w_3264h.jpg"/>
								<p class="title">超完美味道超正的蛋挞配方，比KFC的还要嫩还要香~做过最好吃的蛋挞配方</p>
								<p> FeEl &nbsp;&nbsp;&nbsp;&nbsp; 67778 做过</p>
							</a>
						</div>
						<div class="likemenu">
							<a href="#">
								<img src="img/menubook/7ee9900086f211e6b87c0242ac110003_500w_752h.jpg"/>
								<p class="title">蔓越莓饼干</p>
								<p> 君之 &nbsp;&nbsp;&nbsp;&nbsp; 46737 做过</p>
							</a>
						</div>
						<div class="likemenu">
							<a href="#">
								<img src="img/menubook/4daad8ea877a11e6a9a10242ac110002_469w_701h.jpg"/>
								<p class="title">懒人版糖醋排骨</p>
								<p> 小辞xiaoci &nbsp;&nbsp;&nbsp;&nbsp; 38657 做过</p>
							</a>
						</div>
						<div class="likemenu">
							<a href="#">
								<img src="img/menubook/ed35e338873811e6b87c0242ac110003_450w_600h.jpg"/>
								<p class="title">可乐鸡翅</p>
								<p>  渍 &nbsp;&nbsp;&nbsp;&nbsp; 40401 做过</p>
							</a>
						</div>
				</div>
			</div>
		</div>

  	<div class="conwidth footer"><!----------------页脚---------------->
		<ul>
			<li><a href="#">美食生活杂志</a></li>
			<li><a href="#">厨房工作</a></li>
			<li><a href="#">社区指导原则</a></li>
			<li><a href="#">美拾出版的书</a></li>
			<li><a href="#">帮助中心</a></li>
			<li><a href="#">联系我们</a></li>
			<li><a href="#">意见反馈</a></li>
			<li><a href="#">隐私声明</a></li>
		</ul><br />
		<p>嘿嘿嘿项目组</p>
  	</div>

        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/main.js"></script>
	</body>
</html>
