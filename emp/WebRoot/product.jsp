<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>作品</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/product.css"/>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
</head>

<body>
	<div class="header">
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
                  <li><a href="">首页</a></li>
                  <li class="menu-class"><a href="">菜谱分类</a>
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
                          <span><a href="">查看全部分类</a></span>
                          </div>
                      </div>
                  </li>
                  <li><a href="">菜单</a></li>
                 <li><a href="<%=path%>/queryPro.html">作品动态</a></li>
               
             </ul>
		<div class="dengluzhuce fr">
			<a href="login.html">登录</a>
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
	<div class="konghang"></div>

	<form id="myform" action="<%=path%>/queryPro.html" method="post">
		<div class="conwidth content clearfix">
			<div class="leftcon">
				<div class="ctitle">
					<span>${ins.aac102}&nbsp;的作品</span>
				</div>
				<img src="${ins.aac204}"/>
				<div>
					<div class="author">				
						<img src="${ins.aab106}" width="100px"/>
						<span>${ins.aab102}</span>
						<span style="color:#DD3915">做过</span>
						<span>${ins.aac102}</span>
					</div>
					<div class="fr">
					  <c:choose>
	     				<c:when test="${ins.aad201!=null}">
	     				    <a class="quxiaocang" id="canclezan" onclick="cancleColl('${ins.aac201}')" href="#">已收藏</a>							
						</c:when>
					    <c:otherwise>
					    	<a class="shoucang" id="zan" onclick="giveColl('${ins.aac201}')" href="#" >收藏</a>
					    </c:otherwise>
					  </c:choose>
					  <c:choose>
	     				<c:when test="${ins.aad101!=null}">
	     				    <a class="quxiaozan" id="canclezan" onclick="cancleLike('${ins.aac201}')" href="#">已赞	</a>						
						</c:when>
					    <c:otherwise>
					    	<a class="dianzan" id="zan" onclick="giveLike('${ins.aac201}')" href="#" >赞</a>
					    </c:otherwise>
					  </c:choose>						
					</div>
				</div>				
				<div class="desc">
					<p>${ins.aac203}</p><br/>
				</div>
				<div class="content-title">
					<p>评论</p>
					<div class="content">
						<div class="info">
					    	<img src="img/san.jpg" width="45" height="45">					        
					        <a href="" class="info1">我是用户</a>
					        <span class="info2">        
					                                    重庆 | &nbsp;45分钟前 |
					             <a href=""  class="huifu">回复</a>
					        </span>				        
					    </div>
					    <div class="neirong">
					         	做的太好了
					    </div>
					</div>
			    </div>								
		    </div>	    
		 </div>
	</form>
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
    </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/main.js"></script>
        <script src="layui/layui.js"></script>
        <script type="text/javascript">
        	function giveLike(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/likePro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function cancleLike(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/cancleLikePro.html?aac201="+vaac201; 
        		vform.submit();
        	}
        	function giveColl(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/collectionPro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function cancleColl(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/cancleColl.html?aac201="+vaac201; 
        		vform.submit();
        	}
        </script>
</body>
</html>
