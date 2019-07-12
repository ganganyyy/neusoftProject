<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<meta charset="UTF-8">
	<title>上传作品</title>
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
		${msg}
		<br>
		<br>
		<form id="myform" class="layui-form" action="<%=path%>/uploadPro" method="post" enctype="multipart/form-data">					
			<div class="atitle" style="margin-top: 10px;">
				<span class="alable">上传我做的</span> 
			</div>									
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				<legend>上传图片</legend>
			</fieldset>
			<div class="proimg">
				<div class="layui-upload">
				<button type="button" class="layui-btn" id="uploadQR"><i class="layui-icon">&#xe67c;</i>选择图片</button>
				  <input type="file" onchange="Image(this)" name="images" id="shangchuan">                  
                  <div id="imgPreview" class="layui-upload-list">
					  <img class="layui-upload-img" width="300px" height="200px">
				  </div>
				</div>  						 
              	<div style="color: #c2c2c2;margin:10px 0;">
              		温馨提示: 每次最多上传一张图片, 单张图片的大小不超过2MB
              	</div>				
			</div>
								
			<div class="protext">
				<div>
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>心得</legend>
				    </fieldset>
				</div>
				<div>
					<textarea class="layui-textarea" rows="10" placeholder="说点什么吧" name="aac203"></textarea>
				</div>
			</div>
			<div class="layui-input-block">
      			<input class="layui-btn" type="submit" name="next" value="提交" ">
      			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
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
		   function Image(imgFile) 
		   { 
		    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
		    if(!pattern.test(imgFile.value)) 
		    { 
		     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
		     imgFile.focus(); 
		    } 
		    else 
		    { 
		     var path; 
		     if(document.all)//IE 
		     { 
		      imgFile.select(); 
		      path = document.selection.createRange().text; 
		      document.getElementById("imgPreview").innerHTML=""; 
		      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
		     } 
		     else//FF 
		     { 
		      path = URL.createObjectURL(imgFile.files[0]);
		      document.getElementById("imgPreview").innerHTML = "<img src=' "+path+" ' width='300px' height='200px'/>"; 
		     } 
		    } 
		   }
		   
		   $(document).ready(function(){
			    $('#uploadQR').click(function(){
			        $('#shangchuan').click();
			    });

			});
		  </script> 
</body>
</html>
