<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<meta charset="UTF-8">
	<title>个人菜谱 - 美拾</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/addpro.css"/>
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
	
	<div class="content">
		<form id="myform" action="<%=path%>/addPro.html" method="post">					
			<div class="aa1" style="margin-top: 10px;">
				<span class="aa2">上传我做的</span> 
			</div>					
			<div class="proimg">
				<span class="aa3">选择图片</span>
				<div class="aa4">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<legend>拖拽上传</legend>
					</fieldset> 						 
					<div class="layui-upload-drag" id="test10">
						<i class="layui-icon"></i>
						<p>点击上传，或将文件拖拽到此处</p>
					</div>
				</div> 
			</div>					
			<div class="protext">
				<span class="aa5">心得</span> 
				<div>
					<textarea class="aa6" placeholder="说点什么吧" required></textarea>
				</div>
			</div>
		</form>
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
        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/main.js"></script>
        <script src="layui/layui.js"></script>
        <script>
			layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  
			  //拖拽上传
			  upload.render({
			    elem: '#test10'
			    ,url: '/upload/'
			    ,done: function(res){
			      console.log(res)
			    }
			  });
			});
		</script>
</body>
</html>
