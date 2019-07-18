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

<link rel="stylesheet" href="css/collection/common.css">
<link rel="stylesheet" href="css/collection/page.css">
<link rel="stylesheet" href="css/collection/user.css">

<script src="js/collection/jquery-1.9.1.min.js" type="text/javascript" charset="GBK"></script>
<script src="js/collection/common.js" type="text/javascript" charset="GBK"></script>
<script src="js/collection/user.js" type="text/javascript" charset="GBK"></script>
<script type="text/javascript">
function onFind()
{
	 var aac101="20";
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/details.html?aac101="+aac101;
	 vform.submit();
}
function publish(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/commentReci.html?aac101="+vaac101; 
	vform.submit();
}
function give(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/likeReci.html?aac101="+vaac101; 
	vform.submit();
}
function cancle(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleLikeReci.html?aac101="+vaac101; 
	vform.submit();
}
function shoucang(vaac101,vaad301) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/shoucangReci.html?aac101="+vaac101+"&aad301="+vaad301; 
	vform.submit();
}
function cancleShoucang(vaac101,vaad201) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleshoucangReci.html?aac101="+vaac101+"&aad201="+vaad201; 
	vform.submit();
}
function guanzhu(vaac101,vaac106) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/guanzhu.html?aac101="+vaac101+"&aac106="+vaac106;
	vform.submit();
}
function cancleGuanzhu(vaac101,vaac106) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleGuanzhu.html?aac101="+vaac101+"&aac106="+vaac106; 
	vform.submit();
}
function create(vaac101)
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/creAndColl.html?aac101="+vaac101;
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
					<a href=login.html>登录</a> <a href="register .html">注册</a>
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
		<input type="submit" name="next" value="查询" onclick="onFind()">
		<div class="conwidth content clearfix">
			<h1>${ins.fvalue }&nbsp;&nbsp;${ins.aac102 }</h1>
			<div class="leftcon">
				<img src="${ins.aac108 }"
					style="width: 660px; height: 440px" />
				<div class="cookde">
					<span class="cooknum">${ins.pronum }</span><span>&nbsp;人做过这道菜</span>
					<div class="fr">
						<c:choose>
							<c:when test="${0>1}">
								<a class="layui-btn layui-btn-danger">修改</a>
								<a class="layui-btn layui-btn-danger"
									href="<%=path%>/delreci.html">删除</a>
							</c:when>
							<c:otherwise>
					
					<c:choose>
						<c:when test="${ins.aad101!=null}">
							<a class="layui-btn layui-btn-danger" onclick="cancle('${ins.aac101}')">已赞</a>							
						</c:when>
						<c:otherwise>
							<a class="layui-btn layui-btn-danger" onclick="give('${ins.aac101}')">点赞</a>
						</c:otherwise>
					</c:choose>
						
					<c:choose>
						<c:when test="${ins.aad201!=null}">
							<a class="layui-btn layui-btn-danger" onclick="cancleShoucang('${ins.aac101}','${ins.aad201}')">已收藏</a>							
						</c:when>
						<c:otherwise>
						    <a class="layui-btn layui-btn-danger" id="shoucang" href="javascript:;">收藏</a>
						</c:otherwise>
					</c:choose>
							
							</c:otherwise>
						</c:choose>
						
					</div>
				</div>
				<div class="author">
					<img src="${ins.aab106 }" width="50px" height="50px"/><span>${ins.aab102 }</span>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<c:choose>
						<c:when test="${ins.aab201!=null}">
							<a class="layui-btn layui-btn-danger" onclick="cancleGuanzhu('${ins.aac101}','${ins.aac106}')">已关注</a>							
						</c:when>
						<c:otherwise>
							<a class="layui-btn layui-btn-danger" onclick="guanzhu('${ins.aac101}','${ins.aac106}')">关注</a>
						</c:otherwise>
					</c:choose>
					
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
								<p>${ins.aac402 }</p> <img src="${ins.aac403}"
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
				
				<div>
					<p class="fubiaoti">赞</p><br>
					<c:forEach items="${rows4}" var="ins" varStatus="vs">	
					<a><img src="${ins.aab106}" width="45px" height="45px" style="border-radius: 50%"></a>
					</c:forEach>
			    </div>
			    
			 <div class="kh30"></div>
			    
			<div>
			<p class="fubiaoti">评论</p>
			<c:forEach items="${rows5}" var="ins" varStatus="vs">
                  <div class="content">
					<div class="info">
				    	<img src="${ins.aab106}" width="45px" height="45px"style="border-radius: 50%">					        
				        <a>${ins.aab102}</a>
				    </div>
				    <div class="neirong">
				         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				         ${ins.aad404}
				    </div>
			</div>
			</c:forEach>
			</div>
			    <textarea class="layui-textarea" rows="5" cols="20" placeholder="说点什么吧"
				style="height: 50px" name="aad404"></textarea>
				<br>
			    <div class="anniu">
			    	<button class="layui-btn" id="pinglun" onclick="publish('${ins.aac101}')">发表评论</button>
			    	<button type="reset" class="layui-btn layui-btn-primary">清空</button>
			    </div>
				
				<div class="message">
					<p>该菜谱创建于${ins.aac103 }</p>
					<p>
						<span>${ins.aac110 }</span>收藏
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
					
					<c:choose>
						<c:when test="${rows3.size() != 0}">
						<c:forEach items="${rows3}" var="ins" varStatus="vs">
				     	<div class="likemenu">
						<a href="#"> 
					        <img src="${ins.aac204}"/>
							<p class="title">${ins.aac203 }</p>
					    </a>
					    </div>
				        </c:forEach>
						</c:when>
						<c:otherwise>
							暂未有用户上传作品
						</c:otherwise>
					</c:choose>

				</div>
			</div>
		</div>
		
		 <!--收藏夹弹窗 start-->
        <div class="popup-box popup-manage">
            <div class="popup">
                <div class="popup-tit">添加至收藏夹</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                    <div class="txt-box">
                        <input type="text" maxlength="15" 
                               style="width:250px;height:33px;" name="caad302">
                        <button class="layui-btn" onclick="create('${ins.aac101}')">创建</button>
                    </div>
                    <ul class="list" id="popup-manage-list">			
		<c:choose>
			<c:when test="${rows.size() != 0}">
			<c:forEach items="${rows}" var="insi" varStatus="vs">
            <li onclick="shoucang('${ins.aac101}','${insi.aad301}')">
            <input type="text" value="${insi.aad302}"class="input" disabled>
            </li>
        </c:forEach>
		</c:when>
		<c:otherwise>
		暂无收藏夹
		</c:otherwise>
		</c:choose>
		
                    </ul>
                </div>
            </div>
        </div>
        <!--收藏夹弹窗 end-->
		
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
