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
		<form id="myform" class="layui-form" action="<%=path%>/addPro.html" method="post">					
			<div class="atitle" style="margin-top: 10px;">
				<span class="alable">�ϴ�������</span> 
			</div>									
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				<legend>�ϴ�ͼƬ</legend>
			</fieldset>
			<div class="proimg">
				<div class="layui-upload">
				  <button type="button" class="layui-btn" id="uploadQR"><i class="layui-icon">&#xe67c;</i>ѡ��ͼƬ</button>
				    <input id="fileName" type="text" lay-verify="fileName"
                           autocomplete="off" class="layui-input" disabled>
				    <div class="layui-upload-list" >
					    <img class="layui-upload-img" id="previewImg" style="width: 92px;height: 92px; margin: 0 10px 10px 0;">
					    <p id="demoText"></p>
					</div>	
									
					<input type="hidden" id="fileIds"  value="" name="saac204">
					<input type="hidden" id="response" name="response">
					<input id="credential_hide" name="aac204" type="hidden" lay-verify="credentialOne"
                           autocomplete="off" class="layui-input">
                    <button id="upload_img" type="button" hidden></button>
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

      			<input class="layui-btn" type="submit" name="next" id="sure"
      			       value="�ύ" formaction="<%=path%>/aadPro.html">
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
	        layui.use(['form', 'element', 'upload'], function () {
	            var form = layui.form;
	            var element = layui.element;
	            var $ = layui.jquery;
	            var upload = layui.upload;
		           
	            upload.render({
	                elem: '#uploadQR'
	                , url: '/upload'
	                , accept: 'images'  // �����ϴ����ļ�����
	                , size: 2048        // ��������ϴ����ļ���С  ��λ KB
	                , auto: false
	                , bindAction: '#upload_img'
	                , choose: function (obj) {
	                	//Ԥ�������ļ�ʾ������֧��ie8
	                    obj.preview(function(index, file, result){
	                      $('#previewImg').attr('src', result); //ͼƬ���ӣ�base64��
	                    });
	                }
	                , done: function (res, index, upload) {
	                    //�ϴ��ɹ�
	                    $('#credential_hide').val(res.msg); //���������ֵ
	                    
	                }
	                , error: function (index, upload) {
	                	//��ʾʧ��״̬����ʵ���ش�
	                    var demoText = $('#demoText');
	                    demoText.html('<span style="color: #FF5722;">�ϴ�ʧ��</span> <a class="layui-btn layui-btn-xs demo-reload">����</a>');
	                    demoText.find('.demo-reload').on('click', function(){
	                      uploadInst.upload();
	                    });
	                }
	            });	
	            //ȷ����ť����¼�
	            $('#sure').click(function () {
	                $(this).attr({'disabled': 'disabled'});
	                $('#upload_img').click();//�������ص��ϴ���ť
	            });
	        });
	</script>
</body>
</html>
