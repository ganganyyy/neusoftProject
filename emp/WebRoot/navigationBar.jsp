<!-- author:刘诗滢 -->
<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<title>小熊教你来做菜</title>
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
	
		<!-- 搜索 -->
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
						<input type="text" name="inputHunt"  placeholder="搜索" autocomplete="off" class="layui-input" value="${inputHunt }"> 
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

	
		<!-- 点击和小人 -->
		<div class="nav-icon"  style="float:right;margin-top: 25px;" >		
		  	<a href="#" class="navicon"></a>
		  		<div class="toggle">
		  			<ul class="toggle-menu">
						<li></li>
		  				<li><a  href="mainPage.jsp" id="option1" style="cursor:pointer;">主页</a></li>
		  				<li><a  onclick='selectType("01");' id="option2" style="cursor:pointer;">食谱一览</a></li>
		  				<li><a  href="/emp/queryPro.html" id="option3" style="cursor:pointer;">作品一览</a></li>
		  				<li><a  href="/emp/browsearticle.jsp" id="option4" style="cursor:pointer;">专栏文章</a></li>
		  				<li><a  href="/emp/map.jsp" id="option5" style="cursor:pointer;">美食地图</a></li>
		  				<li><a  onclick="contact();" id="option5" style="cursor:pointer;">联系我们</a></li>
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
		  	
		  	
		  	var aab105Self=${sessionScope.aab105Self};
		
		  	</script>
		  	
		  	<li class="layui-nav-item" style="margin-top:-20px" id="userLi">
		    <a href="" style="color:black;"><img src="${aab106 }" class="layui-nav-img" id="userIcon"></a>
		    <dl class="layui-nav-child">
		      <dd id="examine1"><a  onclick="personal('${sessionScope.aab101Self}');" >个人中心</a></dd>
		      <dd id="examine2"><a  onclick="kitchen('${sessionScope.aab101Self}');" >我的厨房</a></dd>
		      <dd id="examine"><a href="/emp/queryEvent.jsp" >活动管理</a></dd>
		      <dd id="examine3"><a href="/emp/upmanage.html" >升级审核</a></dd>
		      <dd id="examine4"><a href="/emp/checkarticle.html" >文章审核</a></dd>
		      <dd><a onclick="exit();" >退出</a></dd>
		    </dl>
		   </li>
		  </div>
</ul>


<!------------------------以上为导航栏----------------------------------->






</body>

<script src="./layui/layui.js"></script>
<script src="js/navigationBar.js" type="text/javascript" charset="utf-8"></script>

</html>