<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<meta charset="UTF-8">
	<title>���˲��� - ��ʰ</title>
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
		<form id="myform" action="<%=path%>/addPro.html" method="post">					
			<div class="aa1" style="margin-top: 10px;">
				<span class="aa2">�ϴ�������</span> 
			</div>					
			<div class="proimg">
				<span class="aa3">ѡ��ͼƬ</span>
				<div class="aa4">
					<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
						<legend>��ק�ϴ�</legend>
					</fieldset> 						 
					<div class="layui-upload-drag" id="test10">
						<i class="layui-icon">�v</i>
						<p>����ϴ������ļ���ק���˴�</p>
					</div>
				</div> 
			</div>					
			<div class="protext">
				<span class="aa5">�ĵ�</span> 
				<div>
					<textarea class="aa6" placeholder="˵��ʲô��" required></textarea>
				</div>
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
			layui.use('upload', function(){
			  var $ = layui.jquery
			  ,upload = layui.upload;
			  
			  //��ק�ϴ�
			  upload.render({
			    elem: '#test10'
			    ,url: '/upload/'
			    ,done: function(res){
			      console.log(res)
			    }
			  });
			});
		</script>
</body>
</html>
