<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<!DOCTYPE html>
<html>
<head>
<title>��¼ҳ��</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
	<!-- animation-effect -->
<script type="text/javascript" src="./define/js/move-top.js"></script>
		<script type="text/javascript" src="./define/js/easing.js"></script>
		<script src="./define/js/jquery.min.js"></script>
		
</head>
<body>

<!-- style="position:fixed;top:0;width:100%;z-index:999" -->
<ul class="layui-nav" style="position:fixed;top:0;width:100%;z-index:1000">
	
	<div class="layui-row">
		<div class="layui-col-md4 layui-col-md-offset3">
			
				<form class="layui-form" action="<%=path%>/search.html" style="margin-top: 25px" method="post">
				<div class="layui-input-item">
				 <div class="layui-input-block layui-row ">
					<div class ="layui-col-md1">
						<select name="huntOption" lay-verify="required" >
							<option value="ac01" style="color:#63707E;">��ʳ��</option>
							<option value="ab01" style="color:#63707E;">���û�</option>
						</select>
					</div>
					<div class="layui-col-md10"><!-- 1px solid #ccc -->
						<input type="text" name="inputHunt"  placeholder="����" autocomplete="off" class="layui-input"> 
						<!-- style="border-radius: 10px;border: none;color:black;" --> 
						
					</div>
					<div class="layui-col-md1">
						 <button class="layui-btn" lay-submit lay-filter="*" >
							<i class="layui-icon layui-icon-search" style="font-size: 25px;"></i>
						 </button>
					</div>
						
				</div>
				</div>
				</form>
			
		</div>

		<div style="float: right;margin-right: 0; margin-top: 25px;">
	
		  	<div class="nav-icon">		
		  	<a href="#" class="navicon"></a>
		  		<div class="toggle">
		  			<ul class="toggle-menu">
						<li></li>
		  				<li><a class="active" href="mainPage.jsp">��ҳ</a></li>
		  				<li><a  href="menu.html">���˿ռ�</a></li>
		  				<li><a  href="blog.html">�û��ʴ�</a></li>
		  				<li><a  href="typo.html">ר������</a></li>
		  				<li><a  href="contact.html">��ϵ����</a></li>
						<li></li>
						<li></li>
		  			</ul>
		  		</div>
		  	<script>
		  	$('.navicon').on('click', function (e) {
		  	  e.preventDefault();
		  	  $(this).toggleClass('navicon--active');
		  	  $('.toggle').toggleClass('toggle--active');
		  	});
		  	</script>
		  </div>
		</div>
	</div>
</ul>


<!------------------------����Ϊ������----------------------------------->






</body>

<script src="./layui/layui.js"></script>
<script>

layui.use(['element','form'], function(){
	
 var form = layui.form;

  var element = layui.element; //������hoverЧ���������˵��ȹ��ܣ���Ҫ����elementģ��
  //�����������
  element.on('nav(demo)', function(elem){
    //console.log(elem)
    layer.msg(elem.text());
  });

});


</script>
</html>