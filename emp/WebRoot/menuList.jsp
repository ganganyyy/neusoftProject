<!-- author:刘诗滢   搜索后食谱界面-->
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
	
	
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 100px;width:100%;">
		<legend style="font-size: 15px;">您搜索的食谱</legend>
	</fieldset>
	<div class="layui-row layui-col-space10 ">
		
			
			<c:forEach items="${rows }" var="ins" varStatus="status" >
				<div class="layui-col-md4" >
					<div class="layui-card">
						<div class="layui-card-header" style="text-align: center;font-size: 18px;">${ins.aac102}</div>
						<div class="layui-card-body" align="center" style="font-size: 13px;">
							<a onclick="toMenuDetail('${ins.aac101}')">
							<img src="${ins.aac108}" style="width:100%;height: 100%;">
							</a>
							<br/>
							用料<span>${ins.ingredientstr}</span>
							<br/>
							<a onclick="kitchen('${ins.aab101}')">
							${ins.aab102 }  创建
							</a>
							<br/>
							<span>${ins.aac110}收藏</span><span>${ins.aac109}点赞</span>
							<br/>
							<a onclick="toMenuDetail('${ins.aac101}')">
								read more ${ins.aac101}
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