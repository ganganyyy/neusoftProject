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
		  <legend>修改头像</legend>
		</fieldset>
		</div>
		 
		<div class="layui-form-item"> 
		<div class="layui-upload">
		 
		   <button type="button" class="layui-btn" id="choose" style="margin-left: 20%;width: 60%;">选择文件</button>
		   
		  <div class="layui-upload-list">
		  	<!--预览图片-->
		    <img class="layui-upload-img" id="demo1" style="margin-left: 20%;width: 60%;">
		    <!--提示上传信息-->
		    <p id="demoText"></p>
		  </div>
		 
		</div>   
		</div>
		
		
		
		 <div class="layui-form-item">        
                <button class="layui-btn" id="uploadBtn" style="margin-left: 20%;width: 60%;">提交</button>
          </div>
		
		
		<script type="text/javascript" src="layui/layui.js"></script>
		<script>
		
			layui.use(['upload','jquery'], function(){
				var $ = layui.$,
				upload = layui.upload;
				
				
				 //普通图片上传
				  var uploadInst = upload.render({
				    elem: '#choose'//选择文件的DOM对象
				    ,method: 'POST'
				    ,auto: false //选择文件后不自动上传
				    ,bindAction: '#uploadBtn' //指向一个按钮触发上传
				    ,url: '../PhotoUploadServer'
				    ,size: 10240//限制文件大小10M
				    ,choose:function(obj){//选择文件的回调，obj为选中的文件
				    	//将每次选择的文件追加到文件队列
    					var files = obj.pushFile();
    					
    					//预览选中的文件（本地文件）
    					obj.preview(function(index,file,result){
    						 $('#demo1').attr('src', result); 
    					});
				    }
				    ,before: function(obj){//文件上传前的回调
				    	layer.load();
	                    
	                    this.data.title = $('#title').val();
				    }
				    , done: function(data, index, upload) {//上传完毕回调
	                    layer.closeAll('loading');

	                    if (data.no === 1) {
	                        layer.msg("上传成功！", {
	                            icon: 6
	                        });
	                    } else {
	                        layer.msg("上传失败，请稍后重试！", {
	                            icon: 5
	                        });
	                    }
	                    
	                    var uuid = data.uuid;
	                    
	                }
				    ,error: function(){
				    	  layer.closeAll('loading');
		                  layer.msg('网络异常，请稍后重试！');
				      }
				    
				  });
			});
		</script>
		</form>
		</div>
	</body>
	
	<script src="assets/js/jquery.min.js"></script>
</html>
