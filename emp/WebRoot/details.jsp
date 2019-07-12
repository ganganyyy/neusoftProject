<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>菜谱详情</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>

<script type="text/javascript">
function give(vaac201) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/likePro.html?aac201="+vaac201; 
	vform.submit();
}
function cancle(vaac201) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleLikePro.html?aac201="+vaac201; 
	vform.submit();
}
</script>

</head>

<body>
	<div class="header">
		<!--------------头部---------------->
		<div class="conwidth">
			<h1 class="fl">
				<a href="">美<span>拾</span></a>
			</h1>
			<div class="search fl" id="search-box">
				<form action="#" method="get" target="_blank">
					<input type="text" placeholder="搜索菜谱、食材" id="sreach-input"
						class="search-text fl" /> <input type="button" value="搜菜谱"
						class="search-btn fl" />
				</form>
			</div>
			<div class="nav fr">
				<ul>
					<li><a href="index.html">首页</a></li>
					<li class="menu-class"><a href="menu_class.html">菜谱分类</a>
						<div class="topbar-menu">
							<ul class="plain">
								<li class='topbar-menu-head'>常用主题</li>
								<li><a href="menu_class.html">家常菜</a></li>
								<li><a href="menu_class.html">快手菜</a></li>
								<li><a href="menu_class.html">下饭菜</a></li>
								<li><a href="menu_class.html">早餐</a></li>
								<li><a href="menu_class.html">减肥</a></li>
								<li><a href="menu_class.html">汤羹</a></li>
								<li><a href="menu_class.html">烘焙</a></li>
								<li><a href="menu_class.html">小吃</a></li>
							</ul>
							<ul class="plain">
								<li class='topbar-menu-head'>常见食材</li>
								<li><a href="menu_class.html">猪肉</a></li>
								<li><a href="menu_class.html">鸡肉</a></li>
								<li><a href="menu_class.html">牛肉</a></li>
								<li><a href="menu_class.html">鱼</a></li>
								<li><a href="menu_class.html">鸡蛋</a></li>
								<li><a href="menu_class.html">土豆</a></li>
								<li><a href="menu_class.html">茄子</a></li>
								<li><a href="menu_class.html">豆腐</a></li>
							</ul>
							<ul class="plain">
								<li class='topbar-menu-head'>时令食材</li>
								<li><a href="menu_class.html">春笋</a></li>
								<li><a href="menu_class.html">笋</a></li>
								<li><a href="menu_class.html">豌豆</a></li>
								<li><a href="menu_class.html">草莓</a></li>
								<li><a href="menu_class.html">金桔</a></li>
								<li><a href="menu_class.html">菠菜</a></li>
								<li><a href="menu_class.html">冬笋</a></li>
								<li><a href="menu_class.html">韭菜</a></li>
							</ul>
							<div class="span">
								<span><a href="menu_class.html">查看全部分类</a></span>
							</div>
						</div></li>
					<li><a href="popular_menu.html">菜单</a></li>
					<li><a href="">作品动态</a></li>
				</ul>
				<div class="dengluzhuce fr">
					<a href=login.html"">登录</a> <a href="register .html">注册</a>
				</div>
			</div>
		</div>
		<div class="suggest" id="sreach-suggest">
			<!---搜索智能提示suggest-->
			<ul>
				<li>搜" "相关用户</li>
				<li>搜" "相关菜单</li>
			</ul>
		</div>
	</div>
	<div class="konghang"></div>
	<!--因为头部固定而需要设置高度空行把内容撑下去-->

	<form id="myform" action="<%=path%>/details.html" method="post">
		<input type="submit" name="next" value="查询">
		<div class="conwidth content clearfix">
			<h1>${ins.aac102 }</h1>
			<div class="leftcon">
				<img src="img/menubook/${ins.aac108 }"
					style="width: 660px; height: 440px" />
				<div class="cookde">
					<span class="cooknum">0</span><span>&nbsp;人做过这道菜</span>
					<div class="fr">
						<c:choose>
							<c:when test="${1>0}">
								<a class="layui-btn layui-btn-danger">修改</a>
								<a class="layui-btn layui-btn-danger"
									href="<%=path%>/delreci.html">删除</a>
							</c:when>
							<c:otherwise>
							
						    <c:choose>
						<c:when test="${ins.aad101!=null}">
							<a class="quxiaozan" id="canclezan" onclick="cancle('${ins.aac201}')" href="#">已赞</a>							
						</c:when>
						<c:otherwise>
							<a class="dianzan" id="zan" onclick="give('${ins.aac201}')" href="#" >赞</a>
						</c:otherwise>
							</c:choose> 
							
								<a class="layui-btn layui-btn-danger">评论</a>
								<a class="layui-btn layui-btn-danger">收藏</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="author">
					<img
						src="img/menubook/cd9d547428ab11e7947d0242ac110002_271w_209h.jpg" /><span>食在心安</span>
				</div>

				<div class="desc">
					<p>${ins.aac105 }</p>
					<br />
				</div>
				<div class="kh30"></div>

				<h2>&nbsp; 用料</h2>
				<div class="ings">
					<table class="layui-table" lay-skin="line" style="border: 0px">
						<c:forEach items="${rows2 }" var="ins" varStatus="vs">
							<tr>
								<td>${ins.aac603 }</td>
								<td>${ins.aac602 }</td>
							</tr>
						</c:forEach>
					</table>
				</div>

				<div class="kh30"></div>
				<div class="zuofa">
					<div class="title">
						<h2 class="fubiaoti">${ins.aac102 }的做法</h2>
					</div>
					<div>
						<ol>
							<c:forEach items="${rows1 }" var="ins" varStatus="vs">
								<li><span>${ins.aac404 }</span>
								<p>${ins.aac402 }</p> <img src="img/menubook/${ins.aac403 }"
									width="400px" height="270px"></li>
							</c:forEach>
						</ol>
					</div>

					<div class="question">
						<div class="title">
							<h2 class="fubiaoti">${ins.aac102 }的答疑</h2>
						</div>
						关于${ins.aac102 }的做法还有疑问？ <a href="cook_question.html">提一个问题</a>
					</div>

					<div class="upload">上传你做的${ins.aac102 }</div>
				</div>
				<div class="kh30"></div>
			</div>
			<div class="rightcon">
				<div class="kh30"></div>
				<div class="look">
					<div class="title">
						<h2 class="fubiaoti">随便看看</h2>
					</div>
					<span><a href="#">花生仁拌芹菜</a></span><span><a href="#">口袋三明治</a></span>
					<span><a href="#">干锅有机花菜</a></span><span><a href="#">巧克力派</a></span>
					<span><a href="#">香菇红烧鸡块</a></span><span><a href="#">木耳烧腐竹</a></span>
					<span><a href="#">面筋粉面筋</a></span><span><a href="#">紫菜肉片汤</a></span>
					<span><a href="#">腐乳烧肉</a></span><span><a href="#">素炒蘑菇</a></span>
				</div>
				<div class="kh30"></div>
				<div class="message">
					<p>该菜谱创建于${ins.aac103 }</p>
					<p>
						<span>26</span>收藏
					</p>
					<p>版权归作者所有，没有作者本人的书面许可任何人不得转载或使用整体或任何部分的内容。</p>
				</div>
			</div>
		</div>

		<div class="bottomcon">
			<div class="conwidth">
				<div class="kh30"></div>
				<div class="alsolike">
					<div class="title">
						<h2 class="fubiaoti">${ins.aac102 }的作品</h2>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/56f12d74883211e6b87c0242ac110003_2448w_3264h.jpg" />
							<p class="title">超完美味道超正的蛋挞配方，比KFC的还要嫩还要香~做过最好吃的蛋挞配方</p>
							<p>FeEl &nbsp;&nbsp;&nbsp;&nbsp; 67778 做过</p>
						</a>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/7ee9900086f211e6b87c0242ac110003_500w_752h.jpg" />
							<p class="title">蔓越莓饼干</p>
							<p>君之 &nbsp;&nbsp;&nbsp;&nbsp; 46737 做过</p>
						</a>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/4daad8ea877a11e6a9a10242ac110002_469w_701h.jpg" />
							<p class="title">懒人版糖醋排骨</p>
							<p>小辞xiaoci &nbsp;&nbsp;&nbsp;&nbsp; 38657 做过</p>
						</a>
					</div>
					<div class="likemenu">
						<a href="#"> <img
							src="img/menubook/ed35e338873811e6b87c0242ac110003_450w_600h.jpg" />
							<p class="title">可乐鸡翅</p>
							<p>渍 &nbsp;&nbsp;&nbsp;&nbsp; 40401 做过</p>
						</a>
					</div>
				</div>
			</div>
		</div>
	</form>
	<div class="conwidth footer">
		<!----------------页脚---------------->
		<ul>
			<li><a href="#">美食生活杂志</a></li>
			<li><a href="#">厨房工作</a></li>
			<li><a href="#">社区指导原则</a></li>
			<li><a href="#">美拾出版的书</a></li>
			<li><a href="#">帮助中心</a></li>
			<li><a href="#">联系我们</a></li>
			<li><a href="#">意见反馈</a></li>
			<li><a href="#">隐私声明</a></li>
		</ul>
		<br />
		<p>嘿嘿嘿项目组</p>
	</div>
</body>
</html>
