<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath(); %>

<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="layui/css/layui.css"/>
	</head>
	<body>
	<div class="layui-container" style="margin-top:50px;margin-left:30%; width:40%">
        <form class="layui-form" action="<%=path%>/uploadPhoto" enctype="multipart/form-data" method="post">
		
		<div class="layui-form-item">
		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
		  <legend>�޸�ͷ��</legend>
		</fieldset>
		</div>
		 
		<div class="layui-form-item"> 
		<div class="layui-upload">
		 
		   <button type="button" class="layui-btn" id="choose" style="margin-left: 20%;width: 60%;">ѡ���ļ�</button>
		   
		  <div class="layui-upload-list">
		  	<!--Ԥ��ͼƬ-->
		    <img class="layui-upload-img" id="demo1" style="margin-left: 20%;width: 60%;">
		    <!--��ʾ�ϴ���Ϣ-->
		    <p id="demoText"></p>
		  </div>
		 
		</div>   
		</div>
		
		
		
		 <div class="layui-form-item">        
                <button class="layui-btn" id="uploadBtn" style="margin-left: 20%;width: 60%;">�ύ</button>
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
				    ,url: '../PhotoUploadServer'
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
	                        layer.msg("�ϴ�ʧ�ܣ����Ժ����ԣ�", {
	                            icon: 5
	                        });
	                    }
	                    
	                    var uuid = data.uuid;
	                    
	                }
				    ,error: function(){
				    	  layer.closeAll('loading');
		                  layer.msg('�����쳣�����Ժ����ԣ�');
				      }
				    
				  });
			});
		</script>
		</form>
		</div>
	</body>
	
	<script src="assets/js/jquery.min.js"></script>
</html>
