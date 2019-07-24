<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>最近流行食谱</title>
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
		<legend style="font-size: 15px;">最近流行食谱</legend>
	</fieldset>
	<div class="layui-row layui-col-space10 ">
		
			
			<c:forEach items="${rows }" var="ins" varStatus="status" >
				<div class="layui-col-md4" >
					<div class="layui-card">
						<div class="layui-card-header" style="text-align: center;font-size: 18px;">${ins.aac102}</div>
						<div class="layui-card-body" align="center" style="font-size: 13px;">
							<a onclick="toMenuDetail('${ins.aac101}')" style="cursor:pointer;">
							<img src="${ins.aac108}" style="width:250px;height: 180px;">
							</a>
							<p>
							<a onclick="kitchen('${ins.aab101}')" style="cursor:pointer;">
							${ins.aab102 }</a>  创建 
							<span>${ins.ac02count}做过</span>
							</p>
							<p>
							${ins.aac103}
							</p>
							<p>
							<a onclick="toMenuDetail('${ins.aac101}')" style="cursor:pointer;">
								更多细节...
							</a>			
							</p>
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