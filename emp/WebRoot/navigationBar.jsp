<!-- author:刘诗滢 -->
<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<title>登录页面</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
	<!-- animation-effect -->
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>
<script src="js/jump.js" type="text/javascript" charset="utf-8"></script>
		
		
</head>
<body>

<!-- style="position:fixed;top:0;width:100%;z-index:999" -->
<ul class="layui-nav" style="position:fixed;top:0;width:100%;z-index:1000">
	
	<div class="layui-row">
		<div class="layui-col-md4 layui-col-md-offset3">
			
				<form class="layui-form" id="SearchForm" action="<%=path%>/search.html" style="margin-top: 25px" method="post">
				<div class="layui-input-item">
				 <div class="layui-input-block layui-row ">
					<div class ="layui-col-md1">
						<select name="huntOption" lay-verify="required" lay-filter="sch" >
							<option value="ac01" style="color:#63707E;">搜食谱</option>
							<option value="ab01" style="color:#63707E;">搜用户</option>
						</select>
					</div>
					<div class="layui-col-md10"><!-- 1px solid #ccc -->
						<input type="text" name="inputHunt"  placeholder="搜索" autocomplete="off" class="layui-input"> 
						<!-- style="border-radius: 10px;border: none;color:black;" --> 
						
					</div>
					<div class="layui-col-md1">
						 <button class="layui-btn" lay-submit lay-filter="*" >
							<i class="layui-icon layui-icon-search" style="font-size: 25px;"></i>
						 </button>
					</div>
						
				</div>
				</div>
				</form>
			
		</div>

		<!-- <div  style="float:right;margin-top: 25px;"> -->
	
		  	<div class="nav-icon"  style="float:right;margin-top: 25px;" >		
		  	<a href="#" class="navicon"></a>
		  		<div class="toggle">
		  			<ul class="toggle-menu">
						<li></li>
		  				<li><a  href="mainPage.jsp" id="option1">主页</a></li>
		  				<li><a  onclick='selectType("01");' id="option2">食谱一览</a></li>
		  				<li><a  href="/emp/queryPro.html" id="option3">作品一览</a></li>
		  				<li><a  href="typo.html" id="option4">专栏文章</a></li>
		  				<li><a  href="contact.html" id="option5">联系我们</a></li>
						<li></li>
						<li></li>
		  			</ul>
		  		</div>
		  	<script>
		  	$('.navicon').on('click', function (e) {
		  	  e.preventDefault();
		  	  $(this).toggleClass('navicon--active');
		  	  $('.toggle').toggleClass('toggle--active');
		  	});
		  	</script>
		  	
		  	<li class="layui-nav-item" style="margin-top:0px" id="userLi">
		    <a href="" style="color:black;"><img src="${aab106 }" class="layui-nav-img" id="userIcon"></a>
		    <dl class="layui-nav-child">
		      <dd><a href="#" onclick="personal('${sessionScope.aab101Self}');">个人中心</a></dd>
		      <dd><a href="#" onclick="kitchen('${sessionScope.aab101Self}');">我的厨房</a></dd>
		      <dd><a onclick="exit();">退出</a></dd>
		    </dl>
		   </li>
		  </div>
		
		
		
	
		<!-- 用户小人 -->
		
	
<!-- 	</div> -->
</ul>


<!------------------------以上为导航栏----------------------------------->






</body>

<script src="./layui/layui.js"></script>
<script src="js/navigationBar.js" type="text/javascript" charset="utf-8"></script>

</html>