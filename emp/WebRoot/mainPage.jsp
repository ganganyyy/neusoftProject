<!-- author:��ʫ�� -->
<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<!DOCTYPE html>
<html>
<head>
<title>��ҳ</title>
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
		<!--�ֲ�ģ��-->
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
		
		<!--�������-->
		<div class="layui-col-md4 " id="mainActivity">
		
		</div>
		
	</div>
	
	<!--����ʳ��ģ�顢�����û�ģ��-->
	<div class="layui-row layui-col-space30">
		<div class="layui-col-md8 layui-row layui-col-space10" id="latestMenu">
				
				
				
		</div><!--end for a row-->
		
		
		<!--��ߵ�ģ��-->
		<div class="layui-col-md4" id="popularUsers">
			���а�
		</div>
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
<script>

layui.use(['element','carousel','form'], function(){
	
 var form = layui.form;
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
	,height:"420px"
    ,arrow: 'always' //ʼ����ʾ��ͷ
    //,anim: 'updown' //�л�������ʽ
  });
  

 
});


</script>
</html>