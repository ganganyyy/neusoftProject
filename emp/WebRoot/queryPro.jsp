<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<title>作品动态</title>
	<link href="layui/css/layui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
	
	 <script type="text/javascript">
      function onEdit(vaac201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPro.html?aac201="+vaac201;
    	 vform.submit();
      }
   </script>
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

  <div class="conwidth">
  <div class="conwidth survey">
        	<div class="fubiaoti2 clearfix">
        		<h1 style="font-family:'Microsoft YaHei';font-size:34px ">按照菜谱，秀出你的作品</h1>
        	</div>
        	<div class="kh20"></div>
        	
	<div class="userprod clearfix">
		<form id="myform" method="post">	
	         <!-- 显示实际查询到的数据 -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	 <div class="userproduction">
            		<div class="cover">
            			<a href="#" onclick="onEdit('${ins.aac201}')">
            				<img src="${ins.aac204}" alt="作品图片" width="300"/>
            			</a>
            		</div>
        			<p>&nbsp;&nbsp;${ins.aac203}</p>
        			<div class="stars">
        				<span class="a">${ins.aac202}</span>
                    	<span class="b">${ins.aac101}</span>
                    	<span class="c">${ins.aac207}</span>
        			</div>
		         </div>
		      </c:forEach>
		 </form>
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
    </div>


	<script src="js/jquery.min.js" type="text/javascript"></script>
	<script src="js/main.js" type="text/javascript"></script>
	<script src="layui/layui.js"></script>

</body>
</html>