<!-- author:������ -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ include file="navigationBar.jsp" %>
<%@ taglib uri="http://org.wangxg/jsp/extl" prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html>
<head>
<meta charset="UTF-8">
<title>�޸Ĳ���</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" type="text/css" href="css/menu_book.css" />
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">

<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.js" type="text/javascript" charset="utf-8"></script>
<script src="js/main.js"></script>
<script src="layui/layui.js"></script>
<script src="js/updatereci.js"></script>

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
	+"<input type='hidden' name='"+b+"aac401'>"
	+"<input type='hidden' name='"+b+"aac404' value='"+b+"'>"
    +"<div class='layui-col-md3'><textarea rows='5' cols='20' placeholder='��Ӳ�������' style='width:100%;border:0px;height:240px' name='"+b+"aac402'></textarea></div>"
    +"<div class='layui-col-md5'>"
    +"<a href='javascript:;' class='file'>�ϴ�ͼƬ"
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
	<div class="konghang"></div>
	<!--��Ϊͷ���̶�����Ҫ���ø߶ȿ��а����ݳ���ȥ-->

	<form id="myform" action="<%=path%>/updateReci" method="post" enctype="multipart/form-data" >

	<div class="conwidth content clearfix">

	<div class="kh30"></div>
	<input type="hidden" name="aac101" value="${ins.aac101 }">
	<input type="text" name="aac102" required lay-verify="required"
    placeholder="��Ӳ�������" autocomplete="off" class="layui-input" value="${ins.aac102 }">

	<div class="kh30"></div>
    
    <a href="javascript:;" class="file">�ϴ�ͼƬ
    <input type="file" onchange="Image(this)" name="images" /> 
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
		<textarea name="aac105" placeholder="��Ӳ�������" class="layui-textarea" >${ins.aac105 }</textarea>
	</div>

	<div class="kh30"></div>
	<h2>&nbsp; ����</h2>
	
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
		<input class="layui-btn" type="button" value="׷��һ��"
			   onclick="addings()">
	</div>
	
	<div class="kh30"></div>
	<div class="title">
		<h2 class="fubiaoti">����</h2>
	</div>
	<div id="zuofa">
	<input type="hidden" name="aac401count" value="${ins.aac401count }">
	    <c:forEach items="${rows1 }" var="ins" varStatus="vs">				
		<div class="layui-row">
			<div class="layui-col-md1">${ins.aac404 }</div>
			<input type="hidden" name="${vs.count }aac401" value="${ins.aac401 }">
			<input type="hidden" name="${vs.count }aac404" value="1">
			<div class="layui-col-md3">
				<textarea rows="5" cols="20" placeholder="��Ӳ�������"
				style="width: 100%; border: 0px; height: 240px" name="${vs.count }aac402">${ins.aac402 }</textarea>
			</div>
			<div class="layui-col-md5">
			<a href="javascript:;" class="file">�ϴ�ͼƬ
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
	<input class="layui-btn" type="button" value="׷��һ��"
	onclick="addzuofa('zuofa')">
	</div>

			 <div class="kh30"></div>
			  <div class="layui-row">
			    <div class="fubiaoti">�Ƽ�����ϵ</div>
			    <div >
			      <e:select name="aac107" style="width:750px;height:30px;"
						value="����:01,³��:02,����:03,�ղ�:04,���:05,����:06,���:07,�ղ�:08" defval="${ins.aac107 }" />
			    </div>
			  </div>
			
			<div class="kh30"></div>
			<div class="layui-row">
				<div class="layui-col-md4 layui-col-md-offset3">
					<input class="layui-btn" type="button" value="��������"
						style="width: 300px; height: 50px;" onclick="getingsNum()">
				</div>
			</div>
		</div>

	</form>
	<div class="conwidth footer">
		<!----------------ҳ��---------------->
		<ul>
			<li><a href="#">��ʳ������־</a></li>
			<li><a href="#">��������</a></li>
			<li><a href="#">����ָ��ԭ��</a></li>
			<li><a href="#">��ʰ�������</a></li>
			<li><a href="#">��������</a></li>
			<li><a href="#">��ϵ����</a></li>
			<li><a href="#">�������</a></li>
			<li><a href="#">��˽����</a></li>
		</ul>
		<br />
		<p>�ٺٺ���Ŀ��</p>
	</div>
	
</body>
</html>