<!-- author:刘诗滢 -->
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<title>登录页面</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<script src="js/jump.js" type="text/javascript" charset="utf-8"></script>
<script src="js/rankingList.js" type="text/javascript" charset="utf-8"></script>

<link href="./define/css/styles.css" rel="stylesheet">

	<!-- animation-effect -->

<script type="text/javascript" src="./define/js/move-top.js"></script>
		<script type="text/javascript" src="./define/js/easing.js"></script>
		<script src="./define/js/jquery.min.js"></script>
		
</head>
<body>


<div class="layui-container" style="width:68%; margin-top: 100px;">
	
	<div style="text-align:center;font-size:20px;">
		排行榜
	</div>
		<div class="layui-row layui-col-space20">
			<!--明星用户-->
			<div  class="layui-col-md4"  id="ranking1">
			</div>
			
			<!--收藏数-->
			<div class="layui-col-md4" id="ranking2">
			</div>
			
			<!--点赞数-->
			<div class="layui-col-md4" id="ranking3">
			</div>
		</div><!--end for row-->
		
	
	
	
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
<!--导航栏 依赖 element 模块，否则无法进行功能性操作-->
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
	,height:"480px"
    ,arrow: 'always' //始终显示箭头
    //,anim: 'updown' //切换动画方式
  });
  

 
});


</script>
</html>