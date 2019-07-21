<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>

<html>

	<head>
		<meta charset="UTF-8" />
		<title>个人信息管理</title>
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<link rel="stylesheet" type="text/css" href="css/profile.css" />
		<link rel="stylesheet" href="layui/css/layui.css"/>
		<link rel="stylesheet" href="define/css/stylegan.css" media="all">
		  <link rel="stylesheet" href="css/message.css">
	<script type="text/javascript">
	function checkForm(form)
	{
		if(form.aab103.value!=""&&form.aab103.value==form.password.value)
			{
			return true;
			}
		else
		{
			alert("两次输入密码不一致!");
			return false;
		}
	}
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

	<c:if test="${msg!=null }">
    <body onload="open('${msg}');" class="theme-white">
    </c:if>
    <c:if test="${msg==null }" >
    <body class="theme-white">
    </c:if>
    
    <div class="layui-container" style="margin-top:100px;margin-left:10%; width:80%">
    <form class="layui-form" id="myform" action="<%=path%>/updateInfo.html" method="post">
<div class="layui-row">

 

         <div class="layui-col-md3" style="margin-top: 30px;">
         <img src="${photo.aab106 }" class="head-img">
		<ul class="layui-nav layui-nav-tree" lay-filter="test">
<li class="layui-nav-item layui-this" ><a href="#" onclick="toInfo();"><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  个人信息设置</a></li>
<li class="layui-nav-item " ><a href="#" onclick="toPhoto();"><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  修改头像</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toUpgrade();"><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  申请升级</a></li>
<li class="layui-nav-item"><a href="#" onclick="toMessage();"><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  系统消息</a></li>

		</ul> 
		 </div>
        <div class="layui-col-md6">
       <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>修改个人信息</legend>
</fieldset>
  <div class="layui-form-item">
    <label class="layui-form-label">用户名</label>
    <div class="layui-input-block">
      <input type="text" name="aab102" autocomplete="off"  class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">旧密码</label>
    <div class="layui-input-block">
      <input type="password" name="oldaab103" class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">新密码</label>
    <div class="layui-input-block">
      <input type="password" name="aab103"  class="layui-input">
    </div>
  </div>
  
  <div class="layui-form-item">
    <label class="layui-form-label">确认密码</label>
    <div class="layui-input-block">
      <input type="password" name="aae102"  class="layui-input">
    </div>
  </div>
 
  <input type="hidden" name="aab101" value="5">
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1" style="background: #89bcaf;">修改个人信息</button>
    </div>
  </div>
  </div>
  </div>
  	
</form>
</div>
<script src="layui/layui.js" charset="utf-8"></script>
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
  
});
</script>
      
	</body>

</html>