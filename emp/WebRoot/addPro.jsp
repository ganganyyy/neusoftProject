<!-- author:������ -->
<%@ page language="java" pageEncoding="GBK" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>�ϴ���Ʒ</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/addpro.css"/>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">	
	<link rel="stylesheet" href="./layui/css/layui.css" media="all">
	<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
	<link href="./define/css/styles.css" rel="stylesheet">
	<script type="text/javascript" src="./define/js/move-top.js"></script>
	<script type="text/javascript" src="./define/js/easing.js"></script>
	<script src="./define/js/jquery.min.js"></script>
</head>

<body>
	<div class="konghang"></div>
	
	<div class="content">
		<form id="myform" class="layui-form" action="<%=path%>/addPro" method="post" enctype="multipart/form-data">					
			<div class="atitle" style="margin-top: 10px;">
				<span class="alable">�ϴ�������</span> 
			</div>									
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				<legend>�ϴ�ͼƬ</legend>
			</fieldset>
			<div class="proimg">
				<div class="layui-upload">
				<button type="button" class="layui-btn" id="uploadQR">ѡ��ͼƬ</button>
				  <input type="file" onchange="Image(this)" name="images" id="shangchuan">                  
                  <div id="imgPreview" class="layui-upload-list">
					  <img class="layui-upload-img" width="300px" height="200px">
				  </div>
				</div>  						 
              	<div style="color: #c2c2c2;margin:10px 0;">
              		��ܰ��ʾ: ÿ������ϴ�һ��ͼƬ, ����ͼƬ�Ĵ�С������2MB
              	</div>				
			</div>
								
			<div class="protext">
				<div>
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>�ĵ�</legend>
				    </fieldset>
				</div>
				<div>
					<textarea class="layui-textarea" rows="10" placeholder="˵��ʲô��" name="aac203"></textarea>
				</div>
			</div>
			<div class="layui-input-block">
      			<input class="layui-btn" type="submit" name="next" value="�ύ" ">
      			<button type="reset" class="layui-btn layui-btn-primary">����</button>
    		</div> 
    		<input type="hidden" name="aac207" value="${param.aac207}"> 
    		<input type="hidden" name="aab101" value="${sessionScope.aab101Self}"> 					
		</form>
	</div>
	
 	<div class="conwidth footer"><!----------------ҳ��---------------->
        <ul>
            <li><a href="#">��������</a></li>
            <li><a href="#">��ϵ����</a></li>
            <li><a href="#">�������</a></li>
            <li><a href="#">��˽����</a></li>
        </ul><br />
    </div>
        <script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="js/main.js"></script>
        <script src="layui/layui.js"></script>
		<script> 
		   function Image(imgFile) 
		   { 
		    var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
		    if(!pattern.test(imgFile.value)) 
		    { 
		     alert("ϵͳ��֧��jpg/jpeg/png/gif/bmp��ʽ����Ƭ��");  
		     imgFile.focus(); 
		    } 
		    else 
		    { 
		     var path; 
		     if(document.all)//IE 
		     { 
		      imgFile.select(); 
		      path = document.selection.createRange().text; 
		      document.getElementById("imgPreview").innerHTML=""; 
		      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//ʹ���˾�Ч�� 
		     } 
		     else//FF 
		     { 
		      path = URL.createObjectURL(imgFile.files[0]);
		      document.getElementById("imgPreview").innerHTML = "<img src=' "+path+" ' width='300px' height='200px'/>"; 
		     } 
		    } 
		   }
		   
		   $(document).ready(function(){
			    $('#uploadQR').click(function(){
			        $('#shangchuan').click();
			    });

			});
		  </script> 
</body>
</html>
