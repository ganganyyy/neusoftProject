<!-- author:董淑媛 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<meta charset="UTF-8">
<title>上传菜谱</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>
<script src="js/uploadrecipe.js"></script>

<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>
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
	<div class="konghang"></div>
	<!--因为头部固定而需要设置高度空行把内容撑下去-->

	<form id="myform" action="<%=path%>/upreci" method="post" enctype="multipart/form-data" >

	<div class="conwidth content clearfix">

	<div class="kh30"></div>
	<input type="text" name="aac102" required lay-verify="required"
    placeholder="添加菜谱名称" autocomplete="off" class="layui-input">

	<div class="kh30"></div>
    
    <a href="javascript:;" class="file">上传图片
    <input type="file" onchange="Image(this)" name="images"/> 
    </a>
    <div class="layui-upload">
    <div id="imgPreview" class="layui-upload-list">
    <img class="layui-upload-img" width="600px" height="400px">
    </div>
    </div>  
	<div class="kh30"></div>

	<div class="kh30"></div>
	<div class="desc">
		<textarea name="aac105" required lay-verify="required"
			placeholder="添加菜谱描述" class="layui-textarea"></textarea>
	</div>

	<div class="kh30"></div>
	<h2>&nbsp; 用料</h2>
	<input type="hidden" name="ingsNum" id="ingsNum">
	<div class="ings">
		<table class="layui-table">
			<tbody id="ings">
				<tr>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;" name="1aac603"></td>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;" name="1aac602"></td>
				</tr>
				<tr>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;" name="2aac603"></td>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;" name="2aac602"></td>
				</tr>
				<tr>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;" name="3aac603"></td>
					<td><input type="text"
						style="width: 100%; height: 35px; border: 0px;" name="3aac602"></td>
					
				</tr>
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
	    
		<div class="layui-row">
			<div class="layui-col-md1">1</div>
			<input type="hidden" name="1aac404" value="1">
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="添加菜谱描述"
				style="width: 100%; border: 0px; height: 240px" name="1aac402"></textarea>
			</div>
			<div class="layui-col-md5">
			<a href="javascript:;" class="file">上传图片
		    <input type="file" onchange="PreviewImage(this,1)" name="images"/> 
		    </a>
		<div class="layui-upload">
		<div id="imgPreview1" class="layui-upload-list" >
			<img class="layui-upload-img" width="350px" height="250px">
		</div>
	    </div>
			</div>
			
		</div>
		
		<div class="layui-row">
		<div class="kh30"></div>
			<div class="layui-col-md1">2</div>
			<input type="hidden" name="2aac404" value="2">
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="添加菜谱描述"
				style="width: 100%; border: 0px; height: 240px" name="2aac402"></textarea>
			</div>
			<div class="layui-col-md5">
			<a href="javascript:;" class="file">上传图片
		    <input type="file" onchange="PreviewImage(this,2)" name="images"/> 
		    </a>
		<div class="layui-upload">
		<div id="imgPreview2" class="layui-upload-list" >
			<img class="layui-upload-img" width="350px" height="250px">
		</div>
	    </div>
			</div>
			
		</div>
		
		<div class="layui-row">
		<div class="kh30"></div>
			<div class="layui-col-md1">3</div>
			<input type="hidden" name="3aac404" value="3">
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="添加菜谱描述"
				style="width: 100%; border: 0px; height: 240px" name="3aac402"></textarea>
			</div>
			<div class="layui-col-md5">
			<a href="javascript:;" class="file">上传图片
		    <input type="file" onchange="PreviewImage(this,3)" name="images"/> 
		    </a>
		<div class="layui-upload">
		<div id="imgPreview3" class="layui-upload-list" >
			<img class="layui-upload-img" width="350px" height="250px">
		</div>
	    </div>
			</div>
			
		</div>
		
	</div>
								
	<div class="layui-row">
	<input class="layui-btn" type="button" value="追加一步"
	onclick="addzuofa('zuofa')">
	</div>

			 <div class="kh30"></div>
			  <div class="layui-row">
			    <div class="fubiaoti">推荐至菜系</div>
			    <div >
			      <select style="width:750px;height:30px;" name="aac107">
			        <option value="09" selected="">不限</option>
			        <option value="01">川菜</option>
			        <option value="02">鲁菜</option>
			        <option value="03">粤菜</option>
			        <option value="04">苏菜</option>
			        <option value="05">浙菜</option>
			        <option value="06">闽菜</option>
			        <option value="07">湘菜</option>
			        <option value="08">徽菜</option>
			      </select>
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