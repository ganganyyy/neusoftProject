<!-- author:韩金利 -->
<%@ page language="java" pageEncoding="GBK" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>上传作品</title>
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
				<span class="alable">上传我做的</span> 
			</div>									
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				<legend>上传图片</legend>
			</fieldset>
			<div class="proimg">
				<div class="layui-upload">
				<button type="button" class="layui-btn" id="uploadQR">选择图片</button>
				  <input type="file" onchange="Image(this)" name="images" id="shangchuan">                  
                  <div id="imgPreview" class="layui-upload-list">
					  <img class="layui-upload-img" width="300px" height="200px">
				  </div>
				</div>  						 
              	<div style="color: #c2c2c2;margin:10px 0;">
              		温馨提示: 每次最多上传一张图片, 单张图片的大小不超过2MB
              	</div>				
			</div>
								
			<div class="protext">
				<div>
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>心得</legend>
				    </fieldset>
				</div>
				<div>
					<textarea class="layui-textarea" rows="10" placeholder="说点什么吧" name="aac203"></textarea>
				</div>
			</div>
			<div class="layui-input-block">
      			<input class="layui-btn" type="submit" name="next" value="提交" ">
      			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
    		</div> 
    		<input type="hidden" name="aac207" value="${param.aac207}"> 
    		<input type="hidden" name="aab101" value="${sessionScope.aab101Self}"> 					
		</form>
	</div>
	
 	<div class="conwidth footer"><!----------------页脚---------------->
        <ul>
            <li><a href="#">帮助中心</a></li>
            <li><a href="#">联系我们</a></li>
            <li><a href="#">意见反馈</a></li>
            <li><a href="#">隐私声明</a></li>
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
		     alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
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
		      document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
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
