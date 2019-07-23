<!-- author:刘诗滢 -->
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>主页</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>

<script src="js/jump.js" type="text/javascript" charset="utf-8"></script>
<script src="js/mainPage.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
function open(vmsg)
{
	alert(vmsg);	
}
</script>		
</head>
<c:if test="${message!=null }">
    <body onload="open('${message}');">
    </c:if>
    <c:if test="${message==null }">
    <body>
    </c:if>
<div class="layui-container" style="width:80%;">
	
	<div class="layui-row layui-col-space20" style="margin-top: 100px;">
		<!--轮播模块-->
		<div class="layui-col-md8">
			<div class="layui-carousel" id="mainCarousel" >
			  <div carousel-item>
				<div><img src="img/foodlist/14.jpg" ></div>
				<div><img src="img/foodlist/12.jpg" ></div>
				<div><img src="img/foodlist/11.jpg" ></div>
				<div><img src="img/foodlist/18.jpg" ></div>
				<div><img src="img/foodlist/20.jpg"	></div>
			  </div>
			</div>
		</div>
		
		<!--活动公告栏-->
		<div class="layui-col-md4 " id="mainActivity">
		
		</div>
		
	</div>
	
	<!--流行食谱模块、明星用户模块-->
	<div class="layui-row layui-col-space30">
		<div class="layui-col-md8 layui-row layui-col-space10" id="latestMenu">
				
				
				
		</div><!--end for a row-->
		
		
		<!--侧边的模块-->
		<div class="layui-col-md4" id="popularUsers">
			排行榜
		</div>
	</div>
	
	
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
  
  <!--轮播-->
  var carousel = layui.carousel;
  //建造实例
  carousel.render({
    elem: '#mainCarousel'
    ,width: '100%' //设置容器宽度
	,height:"420px"
    ,arrow: 'always' //始终显示箭头
    //,anim: 'updown' //切换动画方式
  });
  

 
});


</script>
</html>