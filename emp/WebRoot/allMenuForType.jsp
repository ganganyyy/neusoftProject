<!-- author:ÁõÊ«äÞ -->
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>Ê³Æ×¹þ¹þ¹þ</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>

		
</head>
<body>
<div class="layui-container" style="width:68%;margin-top:100px">
	
	<form id="typeForm" method="post">
	<span class="layui-breadcrumb" lay-separator="|">
		<a onclick='selectType("02");'>Â³²Ë</a>
		<a onclick='selectType("01");'>´¨²Ë</a>
		<a onclick='selectType("03");'>ÔÁ²Ë</a>
		<a onclick='selectType("06");'>Ãö²Ë</a>
		<a onclick='selectType("04");'>ËÕ²Ë</a>
		<a onclick='selectType("05");'>Õã²Ë</a>
		<a onclick='selectType("07");'>Ïæ²Ë</a>
		<a onclick='selectType("08");'>»Õ²Ë</a>
	</span>
	</form>
		
	<fieldset class="layui-elem-field layui-field-title" style="margin-top:30px;">
	  <legend style="color:grey;font-size:35px">${ins.fvalue }</legend>
	 <!--  <div class="layui-field-box" style="font-size: 15px;color:#c2c2c2">
		<p>Â³²ËµÄÒ»´ó¶Ñ½éÉÜÀ²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²À²
		</p>
	  </div> -->
	</fieldset>
	<div class="layui-row">
	
	<c:forEach items="${rows }" var="ins" varStatus="status" >
		<div class="layui-col-md4" >
			<div class="layui-card">
				<div class="layui-card-body" align="center" style="font-size: 13px;">
					<a onclick="toMenuDetail('${ins.aac101}')">
					<img src="${ins.aac108}" style="width:100%;height: 100%;">
					</a>
					<br/>
					&nbsp;&nbsp;${ins.aac105 }
					
					<p><a onclick="kitchen('${ins.aab101}')">
					${ins.aab102 }</a> ´´½¨
					&nbsp;&nbsp;&nbsp;&nbsp;
					²ËÏµ£º${ins.fvalue }
					</p>
					<br/>
					<a onclick="toMenuDetail('${ins.aac101}')">
						¸ü¶àÏ¸½Ú... 
					</a>			
				</div>
			</div>
		</div>
	</c:forEach>
	
		
	</div>
	
	
	
	<!--Ò³½Å-->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top:100px">
	  <legend align="center" style="color:grey;">contact us</legend>
	  <div class="layui-field-box" align="center" style="font-size: 9px;color:#c2c2c2">
	
		Ð¡ÐÜ½ÐÄã×ö²Ë
		ºÙºÙºÙÐ¡×é³öÆ·
	  </div>
	</fieldset>
</div>


</body>

<script src="./layui/layui.js"></script>
<script src="js/allMenu.js" type="text/javascript" charset="utf-8"></script>

</script>
</html>