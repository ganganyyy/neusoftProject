<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<meta charset="UTF-8">
	<title>上传作品</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/addpro.css"/>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
</head>

<body>
	<div class="header">
	<div class="conwidth">
		<h1 class="fl"><a href="">美<span>拾</span></a></h1>
		<div class="search fl" id="search-box">
			<form action="#" method="get" target="_blank" >
				<input type="text" placeholder="搜索菜谱、食材"
					id="sreach-input" class="search-text fl"/>
				<input type="button" value="搜菜谱" class="search-btn fl"/>
			</form>
		</div>
		<div class="nav fr">
		<ul>
                  <li><a href="">首页</a></li>
                  <li class="menu-class"><a href="">菜谱分类</a>
                      <div class="topbar-menu">
                          <ul class="plain">
                          <li class='topbar-menu-head'>常用主题</li>
                          <li><a href="menu_class.html" >家常菜</a></li>
                          <li><a href="menu_class.html" >快手菜</a></li>
                          <li><a href="menu_class.html" >下饭菜</a></li>
                          <li><a href="menu_class.html" >早餐</a></li>
                          <li><a href="menu_class.html" >减肥</a></li>
                          <li><a href="menu_class.html" >汤羹</a></li>
                          <li><a href="menu_class.html" >烘焙</a></li>
                          <li><a href="menu_class.html" >小吃</a></li>
                          </ul>
                          <ul class="plain">
                          <li class='topbar-menu-head'>常见食材</li>
                          <li><a href="menu_class.html" >猪肉</a></li>
                          <li><a href="menu_class.html" >鸡肉</a></li>
                          <li><a href="menu_class.html" >牛肉</a></li>
                          <li><a href="menu_class.html" >鱼</a></li>
                          <li><a href="menu_class.html" >鸡蛋</a></li>
                          <li><a href="menu_class.html" >土豆</a></li>
                          <li><a href="menu_class.html" >茄子</a></li>
                          <li><a href="menu_class.html" >豆腐</a></li>
                          </ul>
                          <ul class="plain">
                          <li class='topbar-menu-head'>时令食材</li>
                          <li><a href="menu_class.html" >春笋</a></li>
                          <li><a href="menu_class.html" >笋</a></li>
                          <li><a href="menu_class.html" >豌豆</a></li>
                          <li><a href="menu_class.html" >草莓</a></li>
                          <li><a href="menu_class.html" >金桔</a></li>
                          <li><a href="menu_class.html" >菠菜</a></li>
                          <li><a href="menu_class.html" >冬笋</a></li>
                          <li><a href="menu_class.html" >韭菜</a></li>
                          </ul>
                          <div class="span">
                          <span><a href="">查看全部分类</a></span>
                          </div>
                      </div>
                  </li>
                  <li><a href="">菜单</a></li>
                 <li><a href="<%=path%>/queryPro.html">作品动态</a></li>
               
             </ul>
		<div class="dengluzhuce fr">
			<a href="login.html">登录</a>
			<a href="register .html">注册</a>
		</div>
		</div>
	</div>
	         <div class="suggest" id="sreach-suggest"><!---搜索智能提示suggest-->
	             <ul>
	                 <li>搜"  "相关用户</li>
	                 <li>搜"  "相关菜单</li>
	             </ul>
	         </div>
	     </div>
	<div class="konghang"></div>
	
	<div class="content">
		<form id="myform" class="layui-form" action="<%=path%>/addPro.html" method="post">					
			<div class="atitle" style="margin-top: 10px;">
				<span class="alable">上传我做的</span> 
			</div>									
			<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
				<legend>上传图片</legend>
			</fieldset>
			<div class="proimg">
				<div class="layui-upload">
				  <button type="button" class="layui-btn" id="uploadQR"><i class="layui-icon">&#xe67c;</i>选择图片</button>
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

      			<input class="layui-btn" type="submit" name="next" id="sure"
      			       value="提交" formaction="<%=path%>/aadPro.html">
      			<button type="reset" class="layui-btn layui-btn-primary">重置</button>
    		</div>  					
		</form>
	</div>
	
 	<div class="conwidth footer"><!----------------页脚---------------->
        <ul>
            <li><a href="#">美食生活杂志</a></li>
            <li><a href="#">厨房工作</a></li>
            <li><a href="#">社区指导原则</a></li>
            <li><a href="#">美拾出版的书</a></li>
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
	        layui.use(['form', 'element', 'upload'], function () {
	            var form = layui.form;
	            var element = layui.element;
	            var $ = layui.jquery;
	            var upload = layui.upload;
		           
	            upload.render({
	                elem: '#uploadQR'
	                , url: '/upload'
	                , accept: 'images'  // 允许上传的文件类型
	                , size: 2048        // 最大允许上传的文件大小  单位 KB
	                , auto: false
	                , bindAction: '#upload_img'
	                , choose: function (obj) {
	                	//预读本地文件示例，不支持ie8
	                    obj.preview(function(index, file, result){
	                      $('#previewImg').attr('src', result); //图片链接（base64）
	                    });
	                }
	                , done: function (res, index, upload) {
	                    //上传成功
	                    $('#credential_hide').val(res.msg); //隐藏输入框赋值
	                    
	                }
	                , error: function (index, upload) {
	                	//演示失败状态，并实现重传
	                    var demoText = $('#demoText');
	                    demoText.html('<span style="color: #FF5722;">上传失败</span> <a class="layui-btn layui-btn-xs demo-reload">重试</a>');
	                    demoText.find('.demo-reload').on('click', function(){
	                      uploadInst.upload();
	                    });
	                }
	            });	
	            //确定按钮点击事件
	            $('#sure').click(function () {
	                $(this).attr({'disabled': 'disabled'});
	                $('#upload_img').click();//单击隐藏的上传按钮
	            });
	        });
	</script>
</body>
</html>
