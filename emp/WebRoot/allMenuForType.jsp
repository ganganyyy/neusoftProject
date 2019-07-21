<!-- author:��ʫ�� -->
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>ʳ�׹�����</title>
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
		<a onclick='selectType("02");'>³��</a>
		<a onclick='selectType("01");'>����</a>
		<a onclick='selectType("03");'>����</a>
		<a onclick='selectType("06");'>����</a>
		<a onclick='selectType("04");'>�ղ�</a>
		<a onclick='selectType("05");'>���</a>
		<a onclick='selectType("07");'>���</a>
		<a onclick='selectType("08");'>�ղ�</a>
	</span>
	</form>
		
	<fieldset class="layui-elem-field layui-field-title" style="margin-top:30px;">
	  <legend style="color:grey;font-size:35px">${ins.fvalue }</legend>
	 <!--  <div class="layui-field-box" style="font-size: 15px;color:#c2c2c2">
		<p>³�˵�һ��ѽ�������������������������������������������������������������������
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
					${ins.aab102 }</a> ����
					&nbsp;&nbsp;&nbsp;&nbsp;
					��ϵ��${ins.fvalue }
					</p>
					<br/>
					<a onclick="toMenuDetail('${ins.aac101}')">
						����ϸ��... 
					</a>			
				</div>
			</div>
		</div>
	</c:forEach>
	
		
	</div>
	
	
	
	<!--ҳ��-->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top:100px">
	  <legend align="center" style="color:grey;">contact us</legend>
	  <div class="layui-field-box" align="center" style="font-size: 9px;color:#c2c2c2">
	
		С�ܽ�������
		�ٺٺ�С���Ʒ
	  </div>
	</fieldset>
</div>


</body>

<script src="./layui/layui.js"></script>
<script src="js/allMenu.js" type="text/javascript" charset="utf-8"></script>

</script>
</html>