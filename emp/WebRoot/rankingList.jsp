<!-- author:��ʫ�� -->
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<title>��¼ҳ��</title>
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
		���а�
	</div>
		<div class="layui-row layui-col-space20">
			<!--�����û�-->
			<div  class="layui-col-md4"  id="ranking1">
			</div>
			
			<!--�ղ���-->
			<div class="layui-col-md4" id="ranking2">
			</div>
			
			<!--������-->
			<div class="layui-col-md4" id="ranking3">
			</div>
		</div><!--end for row-->
		
	
	
	
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
<script>

layui.use(['element','carousel','form'], function(){
	
 var form = layui.form;
<!--������ ���� element ģ�飬�����޷����й����Բ���-->
  var element = layui.element; //������hoverЧ���������˵��ȹ��ܣ���Ҫ����elementģ��
  //�����������
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });
  
  <!--�ֲ�-->
  var carousel = layui.carousel;
  //����ʵ��
  carousel.render({
    elem: '#mainCarousel'
    ,width: '100%' //�����������
	,height:"480px"
    ,arrow: 'always' //ʼ����ʾ��ͷ
    //,anim: 'updown' //�л�������ʽ
  });
  

 
});


</script>
</html>