<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>上传菜谱</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>

<script>
    function addings()
    {
        var tableobj =document.getElementById("ings");
        var trobj =document.createElement("tr");
        for (var i = 0; i < 2; i++) 
        {
            var tdobj = document.createElement("td");
            tdobj.innerHTML="<input type='text' style='width:100%; height:35px;border:0px;'>";
            trobj.appendChild(tdobj);
        }
        var tdobj = document.createElement("td");
        tdobj.innerHTML="<a class='layui-btn layui-btn-danger' onclick='delecttr(this)'>删除</a>";
        trobj.appendChild(tdobj);
        tableobj.appendChild(trobj);
    }
    
    var j=4;
    var b=j;
    function addzuofa()
    {
        var obj =document.getElementById("zuofa");

        for(var i=1;i<2;i++)
        	{
            var rowobj = document.createElement("div");
            var seqobj = document.createElement("div");
            rowobj.className = "layui-row";
            b = j++;
        	}
    	rowobj.innerHTML="<div class='kh30'></div>"
    	+"<div class='layui-col-md1'>" + b +"</div>"
        +"<div class='layui-col-md3'><textarea rows='5' cols='20' placeholder='添加菜谱描述' style='width:100%;border:0px;height:240px'></textarea></div>"
        +"<div class='layui-col-md5'>"
        +"<input type='file' onchange='PreviewImage(this, "+b+")' name='images'/>"
        +"<div class='layui-upload'>"
        +"<button type='button' class='layui-btn' name='aac108'>上传图片</button>"
        +"<div class='layui-upload-list' id='imgPreview"+b+"' >"
        +"<img class='layui-upload-img' width='350px' height='250px'>"
        +"</div>"
        +"</div>"
        +"</div>"
        +"<div class='layui-col-md2'><br><br><br><br><br>&nbsp;&nbsp;<a class='layui-btn layui-btn-danger' onclick='delecttr(this)'>删除</a></div>";

        obj.appendChild(rowobj);
    }
    function delecttr(obj)
        {
        var tr = obj.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
        }

    //菜谱图片
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
       document.getElementById("imgPreview").innerHTML = "<img src=' "+path+" ' width='600px' height='400px'/>";
      } 
     } 
    }
    
    //步骤图片
    function PreviewImage(imgFile,i) 
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
       document.getElementById("imgPreview"+ i).innerHTML = "<img src=' "+path+" ' width='350px' height='250px'/>";
      } 
     } 
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
					<a href="login.html">登录</a> <a href="register .html">注册</a>
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

	<form id="myform" action="<%=path%>/upload" method="post" enctype="multipart/form-data" >

		<div class="conwidth content clearfix">

			<div class="kh30"></div>
			<input type="text" name="aac102" required lay-verify="required"
		    placeholder="添加菜谱名称" autocomplete="off" class="layui-input">

	<div class="kh30"></div>
    <input type="file" onchange="Image(this)" name="images"/> 
	<div class="layui-upload">
    <button type="submit" class="layui-btn" name="upload" formaction="<%=path%>/upload" formenctype="multipart/form-data">上传图片</button>
    <div id="imgPreview" class="layui-upload-list">
    <img class="layui-upload-img" width="600px" height="400px">
    </div>
    </div>  

			<div class="kh30"></div>
			<div class="author">
				<img src="img/menubook/1.jpg" style="width: 50px; height: 50px" /><span>食在心安</span>
			</div>

			<div class="kh30"></div>
			<div class="desc">
				<textarea name="" required lay-verify="required"
					placeholder="添加菜谱描述" class="layui-textarea"></textarea>
			</div>

			<div class="kh30"></div>
			<h2>&nbsp; 用料</h2>
			<div class="ings">
				<table class="layui-table">
					<tbody id="ings">
						<tr>
							<td><input type="text"
								style="width: 100%; height: 35px; border: 0px;"></td>
							<td><input type="text"
								style="width: 100%; height: 35px; border: 0px;"></td>
							<td><a class="layui-btn layui-btn-danger"
								onclick="delecttr(this)">删除</a></td>
						</tr>
					</tbody>
				</table>
				<input class="layui-btn" type="button" value="追加一行"
					onclick="addings()">
			</div>

			<div class="title">
				<h2 class="fubiaoti">做法</h2>
			</div>
			<div class="kh30"></div>
			<div id="zuofa">
				<div class="layui-row">
					<div class="layui-col-md1">1</div>
					<div class="layui-col-md3">
						<textarea rows="5" cols="20" placeholder="添加菜谱描述"
							style="width: 100%; border: 0px; height: 240px"></textarea>
					</div>
					<div class="layui-col-md5">
					<input type="file" onchange="PreviewImage(this,1)" name="images" />
				<div class="layui-upload">
				<button type="button" class="layui-btn" name="aac108">上传图片</button>
				<div id="imgPreview1" class="layui-upload-list" >
					<img class="layui-upload-img" width="350px" height="250px">
				</div>
			    </div>
					</div>
					<div class="layui-col-md2">
						<br>
						<br>
						<br>
						<br>
						<br>&nbsp;&nbsp;<a class="layui-btn layui-btn-danger"
							onclick="delecttr(this)">删除</a>
					</div>
				</div>
			</div>
			<input class="layui-btn" type="button" value="追加一步"
				onclick="addzuofa('zuofa')">

			<div class="kh30"></div>

			<div class="layui-row">
				<div class="layui-col-md4 layui-col-md-offset3">
					<input class="layui-btn" type="submit" value="发布菜谱"
						style="width: 300px; height: 50px;">
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