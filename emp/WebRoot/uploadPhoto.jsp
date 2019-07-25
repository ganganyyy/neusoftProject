<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css"/>
		 <link rel="stylesheet" href="define/css/stylegan.css" media="all">
        <link rel="stylesheet" href="css/message.css">
    <script type="text/javascript">
    function toUpgrade()
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/upgradeCount.html";
  	 vform.submit();
    } 
    function toMessage()
    {
    	var vform = document.getElementById("myform");
     	vform.action="<%=path%>/queryMessage.html";
     	vform.submit();
    }
    function toPhoto()
    {
    	var vform = document.getElementById("myform");
     	vform.action="<%=path%>/queryPhoto.html";
     	vform.submit();
    }
    function toInfo()
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/queryPersonalInfo.html";
  	 vform.submit();
    } 
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
	<div class="layui-container" style="margin-top:90px;margin-left:10%; width:80%">
         <form id="myform" class="layui-form" action="<%=path%>/uploadPhoto" enctype="multipart/form-data" method="post">
        <div class="layui-row">
         <div class="layui-col-md3" style="margin-top: 30px;">
		 <img src="${ins.aab106 }" class="head-img">
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
<li class="layui-nav-item" ><a href="#" onclick="toInfo();"><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  ������Ϣ����</a></li>
<li class="layui-nav-item layui-this" ><a href="#" onclick="toPhoto();"><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  �޸�ͷ��</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toUpgrade();"><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  ��������</a></li>
<li class="layui-nav-item"><a href="#" onclick="toMessage();"><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  ϵͳ��Ϣ</a></li>

		</ul> 
		 </div>
        <div class="layui-col-md9">
       
		
		<div class="layui-form-item">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
		  <legend>�޸�ͷ��</legend>
		</fieldset>
		</div>
		 
		<div class="layui-form-item"> 
		<div class="layui-upload" style="width: 350px;style="margin-left: 20%;width: 60%;">
		 
		   <button type="button" class="layui-btn" id="choose" style="background: #89bcaf;margin-left: 40%;width: 100%;">ѡ��ͼƬ</button>
		   
		  <div class="layui-upload-list">
		  	<!--Ԥ��ͼƬ-->
		    <img class="layui-upload-img" id="demo1" style="margin-left: 40%;width: 100%;">
		    <!--��ʾ�ϴ���Ϣ-->
		    <p id="demoText"></p>
		  </div>
		 <button class="layui-btn" id="uploadBtn" style="margin-left: 40%;width: 100%;background: #89bcaf;">�ύ</button>
		</div>   
		
		</div>
		
		
		
		 <div class="layui-form-item">        
                
          </div>
		
		
		<script type="text/javascript" src="layui/layui.js"></script>
		<script>
		
			layui.use(['upload','jquery'], function(){
				var $ = layui.$,
				upload = layui.upload;
				
				
				 //��ͨͼƬ�ϴ�
				  var uploadInst = upload.render({
				    elem: '#choose'//ѡ���ļ���DOM����
				    ,method: 'POST'
				    ,auto: false //ѡ���ļ����Զ��ϴ�
				    ,bindAction: '#uploadBtn' //ָ��һ����ť�����ϴ�
				    ,url: '../PhotoUploadServlet'
				    ,size: 10240//�����ļ���С10M
				    ,choose:function(obj){//ѡ���ļ��Ļص���objΪѡ�е��ļ�
				    	//��ÿ��ѡ����ļ�׷�ӵ��ļ�����
    					var files = obj.pushFile();
    					
    					//Ԥ��ѡ�е��ļ��������ļ���
    					obj.preview(function(index,file,result){
    						 $('#demo1').attr('src', result); 
    					});
				    }
				    ,before: function(obj){//�ļ��ϴ�ǰ�Ļص�
				    	layer.load();
	                    
	                    this.data.title = $('#title').val();
				    }
				    , done: function(data, index, upload) {//�ϴ���ϻص�
	                    layer.closeAll('loading');

	                    if (data.no === 1) {
	                        layer.msg("�ϴ��ɹ���", {
	                            icon: 6
	                        });
	                    } else {
	                        layer.msg("", {
	                            icon: 5
	                        });
	                    }
	                    
	                    var uuid = data.uuid;
	                    
	                }
				    ,error: function(){
				    	  layer.closeAll('loading');
				      }
				    
				  });
			});
		</script>
		
		</div>
		</div>
		</form>
		</div>
	</body>
	
	<script src="assets/js/jquery.min.js"></script>
</html>
