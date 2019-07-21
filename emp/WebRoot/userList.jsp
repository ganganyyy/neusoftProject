<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>登录页面</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
		<script type="text/javascript" src="./define/js/easing.js"></script>
		<script src="./define/js/jquery.min.js"></script>
		
		<script src="js/jump.js" type="text/javascript" charset="utf-8"></script>
</head>
<body>

<div class="layui-container" style="width:68%;">
	
	<!--流行食谱模块、明星用户模块-->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 100px;width:100%;">
		<legend style="font-size: 15px;">您搜索的用户</legend>
	</fieldset>
	<div class="layui-row layui-col-space10 ">
		
			
			<c:forEach items="${rows }" var="ins" varStatus="status" >
				<div class="layui-col-md4" >
					<div class="layui-card">
						
						<div class="layui-card-body" align="center" style="font-size: 13px;">
							<a onclick="kitchen('${ins.aab101}')" style="cursor:pointer;">
							<img class="layui-nav-img" src="${ins.aab106}" style="width:100px;height: 80px;">
							</a>
							<br/>
							<a onclick="kitchen('${ins.aab101}')" style="cursor:pointer;">${ins.aab102}</a>
							<p><span>${ins.ac01count}食谱</span><span>${ins.ac02count}作品</span></p>
							<p><span>${ins.aab107}关注</span><span>${ins.aab108}被关注</span></p>
							<br/>
							<a onclick="kitchen('${ins.aab101}')" style="cursor:pointer;">
								read more
							</a>			
						</div>
					</div>
				</div>
			</c:forEach>
				
			
	</div><!--end for a row-->
	
	
	<!--页脚-->
	<fieldset class="layui-elem-field layui-field-title" style="margin-top:100px">
	  <legend align="center" style="color:grey;">contact us</legend>
	  <div class="layui-field-box" align="center" style="font-size: 9px;color:#c2c2c2">
	
		小熊叫你做菜
		嘿嘿嘿小组出品
	  </div>
	</fieldset>
</div>


</body>

<script src="./layui/layui.js"></script>
<script>

layui.use(['element','carousel','form'], function(){
	
 var form = layui.form;

  var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  //监听导航点击
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });

});


</script>
</html>