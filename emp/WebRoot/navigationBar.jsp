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
<script src="js/nacigationBar.js" type="text/javascript" charset="utf-8"></script>
		
		
</head>
<body>

<!-- style="position:fixed;top:0;width:100%;z-index:999" -->
<ul class="layui-nav" style="position:fixed;top:0;width:100%;z-index:1000">
	
	<div class="layui-row">
		<div class="layui-col-md4 layui-col-md-offset3">
			
				<form class="layui-form" id="myform" action="<%=path%>/search.html" style="margin-top: 25px" method="post">
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
		  				<li><a class="active" href="mainPage.jsp">主页</a></li>
		  				<li><a  href="#" onclick="toMessage();">系统消息</a></li>
		  				<li><a  href="blog.html">用户问答</a></li>
		  				<li><a  href="typo.html">专栏文章</a></li>
		  				<li><a  href="contact.html">联系我们</a></li>
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
<script>

layui.use(['element','form'], function(){
	
 var form = layui.form;

  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });

  form.on('select(sch)', function(data){
		 var input=document.getElementsByName("inputHunt")[0];
		 if(data.value=="ab01")
		 {
			 input.placeholder="搜索用户";
		 }
		 else
		 {
			 input.placeholder="搜索食谱";
		 }
	});      
});


</script>
</html>