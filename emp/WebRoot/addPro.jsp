<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<meta charset="UTF-8">
	<title>�ϴ���Ʒ</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/addpro.css"/>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
</head>

<body>
	<div class="header">
	<div class="conwidth">
		<h1 class="fl"><a href="">��<span>ʰ</span></a></h1>
		<div class="search fl" id="search-box">
			<form action="#" method="get" target="_blank" >
				<input type="text" placeholder="�������ס�ʳ��"
					id="sreach-input" class="search-text fl"/>
				<input type="button" value="�Ѳ���" class="search-btn fl"/>
			</form>
		</div>
		<div class="nav fr">
		<ul>
                  <li><a href="">��ҳ</a></li>
                  <li class="menu-class"><a href="">���׷���</a>
                      <div class="topbar-menu">
                          <ul class="plain">
                          <li class='topbar-menu-head'>��������</li>
                          <li><a href="menu_class.html" >�ҳ���</a></li>
                          <li><a href="menu_class.html" >���ֲ�</a></li>
                          <li><a href="menu_class.html" >�·���</a></li>
                          <li><a href="menu_class.html" >���</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >�決</a></li>
                          <li><a href="menu_class.html" >С��</a></li>
                          </ul>
                          <ul class="plain">
                          <li class='topbar-menu-head'>����ʳ��</li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >ţ��</a></li>
                          <li><a href="menu_class.html" >��</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          </ul>
                          <ul class="plain">
                          <li class='topbar-menu-head'>ʱ��ʳ��</li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >��</a></li>
                          <li><a href="menu_class.html" >�㶹</a></li>
                          <li><a href="menu_class.html" >��ݮ</a></li>
                          <li><a href="menu_class.html" >���</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >�²�</a></li>
                          </ul>
                          <div class="span">
                          <span><a href="">�鿴ȫ������</a></span>
                          </div>
                      </div>
                  </li>
                  <li><a href="">�˵�</a></li>
                 <li><a href="<%=path%>/queryPro.html">��Ʒ��̬</a></li>
               
             </ul>
		<div class="dengluzhuce fr">
			<a href="login.html">��¼</a>
			<a href="register .html">ע��</a>
		</div>
		</div>
	</div>
	         <div class="suggest" id="sreach-suggest"><!---����������ʾsuggest-->
	             <ul>
	                 <li>��"  "����û�</li>
	                 <li>��"  "��ز˵�</li>
	             </ul>
	         </div>
	     </div>
	<div class="konghang"></div>
	
	<div class="content">
		${msg}
		<br>
		<br>
		<form id="myform" class="layui-form" action="<%=path%>/uploadPro" method="post" enctype="multipart/form-data">					
			<div class="atitle" style="margin-top: 10px;">
				<span class="alable">�ϴ�������</span> 
			</div>									
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				<legend>�ϴ�ͼƬ</legend>
			</fieldset>
			<div class="proimg">
				<div class="layui-upload">
				<button type="button" class="layui-btn" id="uploadQR"><i class="layui-icon">&#xe67c;</i>ѡ��ͼƬ</button>
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
		</form>
	</div>
	
 	<div class="conwidth footer"><!----------------ҳ��---------------->
        <ul>
            <li><a href="#">��ʳ������־</a></li>
            <li><a href="#">��������</a></li>
            <li><a href="#">����ָ��ԭ��</a></li>
            <li><a href="#">��ʰ�������</a></li>
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
