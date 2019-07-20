<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>修改菜谱</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>
<script src="js/updatereci.js"></script>
</head>
<script type="text/javascript">
function addzuofa()
{
	var b=getaac404()+1;
    var obj =document.getElementById("zuofa");

    for(var i=1;i<2;i++)
    	{
        var rowobj = document.createElement("div");
        rowobj.className = "layui-row";
    	}
	rowobj.innerHTML="<div class='kh30'></div>"
	+"<div class='layui-col-md1'>"+b+"</div>"
	+"<input type='hidden' name='"+b+"aac401'>"
	+"<input type='hidden' name='"+b+"aac404' value='"+b+"'>"
    +"<div class='layui-col-md3'><textarea rows='5' cols='20' placeholder='添加菜谱描述' style='width:100%;border:0px;height:240px' name='"+b+"aac402'></textarea></div>"
    +"<div class='layui-col-md5'>"
    +"<a href='javascript:;' class='file'>上传图片"
    +"<input type='file' onchange='PreviewImage(this, "+b+")' name='images'/> </a>"
    +"<div class='layui-upload'>"
    +"<div class='layui-upload-list' id='imgPreview"+b+"'>"
    +"<img class='layui-upload-img' width='350px' height='250px'>"
    +"</div>"
    +"</div>"
    +"</div>";
    obj.appendChild(rowobj);
}
function addings()
{
	var a=getaac601()+1;
    var tableobj =document.getElementById("ings");
    var trobj =document.createElement("tr");
    var tdobj4 = document.createElement("td");
    tdobj4.innerHTML="<input type='hidden' name='"+a+"aac601'>";
    trobj.appendChild(tdobj4);
    var tdobj1 = document.createElement("td");
    tdobj1.innerHTML="<input type='text' style='width:100%; height:35px;border:0px;' name='"+a+"aac603'>";
    trobj.appendChild(tdobj1);
    var tdobj2 = document.createElement("td");
    tdobj2.innerHTML="<input type='text' style='width:100%; height:35px;border:0px;' name='"+a+"aac602'>";
    trobj.appendChild(tdobj2);
    tableobj.appendChild(trobj);
}

</script>

<style>
.file {
    position: relative;
    display: inline-block;
    background: #009688;
    border: 1px solid #99D3F5;
    border-radius: 4px;
    padding: 4px 12px;
    overflow: hidden;
    color: #F0F0F0;
    text-decoration: none;
    text-indent: 0;
    line-height: 20px;
}
.file input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
}
.file:hover {
    background: #009688;
    border-color: #78C3F3;
    color: #F0F0F0;
    text-decoration: none;
}

</style>
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

	<form id="myform" action="<%=path%>/updateReci" method="post" enctype="multipart/form-data" >

	<div class="conwidth content clearfix">

	<div class="kh30"></div>
	<input type="hidden" name="aac101" value="${ins.aac101 }">
	<input type="text" name="aac102" required lay-verify="required"
    placeholder="添加菜谱名称" autocomplete="off" class="layui-input" value="${ins.aac102 }">

	<div class="kh30"></div>
    
    <a href="javascript:;" class="file">上传图片
    <input type="file" onchange="Image(this)" name="images"/> 
    </a>
    <div class="layui-upload">
    <div id="imgPreview" class="layui-upload-list">
    <img class="layui-upload-img" width="600px" height="400px" src="${ins.aac108 }">
    </div>
    </div>  
	<div class="kh30"></div>
	<div class="author">
	<input type="hidden" name="aac106">
		<img src="${ins.aab106 }" style="width: 50px; height: 50px;border-radius:50%;"/><span>${ins.aab102 }</span>
	</div>

	<div class="kh30"></div>
	<div class="desc">
		<textarea name="aac105" placeholder="添加菜谱描述" class="layui-textarea" >${ins.aac105 }</textarea>
	</div>

	<div class="kh30"></div>
	<h2>&nbsp; 用料</h2>
	
	<input type="hidden" name="ingsNum" id="ingsNum">
	<input type="hidden" name="aac601count" value="${ins.aac601count }">
	<div class="ings">
		<table class="layui-table" lay-skin="line" style="border: 0px">
		<tbody id="ings">
			<c:forEach items="${rows2 }" var="ins" varStatus="vs">
				<tr>
				<td><input type="hidden" name="${vs.count }aac601" value="${ins.aac601 }"></td>
					<td><input type="text"style="width: 100%; height: 35px; 
					border: 0px;" name="${vs.count }aac603"value="${ins.aac603 }"></td>
					<td><input type="text"style="width: 100%; height: 35px; 
					border: 0px;" name="${vs.count }aac602"value="${ins.aac602 }"></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
		<input class="layui-btn" type="button" value="追加一行"
			   onclick="addings()">
	</div>
	
	<div class="kh30"></div>
	<div class="title">
		<h2 class="fubiaoti">做法</h2>
	</div>
	<div id="zuofa">
	<input type="hidden" name="aac401count" value="${ins.aac401count }">
	    <c:forEach items="${rows1 }" var="ins" varStatus="vs">				
		<div class="layui-row">
			<div class="layui-col-md1">${ins.aac404 }</div>
			<input type="hidden" name="${vs.count }aac401" value="${ins.aac401 }">
			<input type="hidden" name="${vs.count }aac404" value="1">
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="添加菜谱描述"
				style="width: 100%; border: 0px; height: 240px" name="${vs.count }aac402">${ins.aac402 }</textarea>
			</div>
			<div class="layui-col-md5">
			<a href="javascript:;" class="file">上传图片
		    <input type="file" onchange="PreviewImage(this,'${vs.count }')" name="images"/> 
		    </a>
			<div class="layui-upload">
			<div id="imgPreview${vs.count }" class="layui-upload-list" >
				<img src="${ins.aac403}" class="layui-upload-img" width="350px" height="250px">
			</div>
		    </div>
			</div>
		</div>
		</c:forEach>
	</div>
								
	<div class="layui-row">
	<input class="layui-btn" type="button" value="追加一步"
	onclick="addzuofa('zuofa')">
	</div>

			 <div class="kh30"></div>
			  <div class="layui-row">
			    <div class="fubiaoti">推荐至菜系</div>
			    <div >
			      <e:select name="aac107" style="width:750px;height:30px;"
						value="川菜:01,鲁菜:02,粤菜:03,苏菜:04,浙菜:05,闽菜:06,湘菜:07,徽菜:08" defval="${ins.aac107 }" />
			    </div>
			  </div>
			
			<div class="kh30"></div>
			<div class="layui-row">
				<div class="layui-col-md4 layui-col-md-offset3">
					<input class="layui-btn" type="button" value="发布菜谱"
						style="width: 300px; height: 50px;" onclick="getingsNum()">
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