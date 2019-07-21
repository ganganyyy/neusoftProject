<!-- author:刘诗滢    注册界面 -->
<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>注册页面</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/style.css">
</head>
<body class="layui-bg-gray">
<div class="layui-container"  style="width:520px;margin-top:100px;" >
<fieldset class="layui-elem-field layui-field-title" style="width:550px">
  <legend align="center">注册</legend>
  <div class="layui-field-box" align="center" style="font-size: 12px;color:#c2c2c2">

	小熊教你做菜
	嘿嘿嘿小组出品
  </div>
</fieldset>
</br>

<form class="layui-form"> <!-- 提示：如果你不想用form，你可以换成div等任何一个普通元素 -->
  <div class="layui-form-item">
    <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
    <div class="layui-input-block">
      <input type="text" name="aab104" placeholder="请输入手机号码" autocomplete="off" class="layui-input" lay-verify="phone|required">	  
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
    <div class="layui-input-block">
      <input type="text" name="aab103" placeholder="请输入密码" autocomplete="off" class="layui-input" lay-verify="aab103">	  
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
    <div class="layui-input-block">
      <input type="text" name="repeat" placeholder="请输入确认密码" autocomplete="off" class="layui-input" lay-verify="required">	  
    </div>
  </div>
  
   <div class="layui-form-item">
   <label class="layui-form-label"><i class="layui-icon layui-icon-vercode"></i></label>
    <div class="layui-inline" >
      <input type="text" name="inputCode" placeholder="请输入验证码" autocomplete="off" class="layui-input"  lay-verify="inputCode"
	  style="width:235px">
    </div>
	<div class="layui-inline" style="position: absolute;margin-left: 10px;">
	  <button class="layui-btn" lay-submit lay-filter="btnVerify" style="width:125px" name="getVerify" onclick="changeRequired('1');" >获取短信验证码</button>
	</div>
  </div>
  
 
  <div class="layui-input-item">
    <div class="layui-input-block layui-row">
		<div class="layui-col-md6">
			<button class="layui-btn" lay-submit lay-filter="btnSubmit" style="width:100%" name="next" onclick="changeRequired('2');">立即提交</button>
		</div>
		<div class="layui-col-md5 layui-col-md-offset1">
			<button type="reset" class="layui-btn layui-btn-primary" style="width:100%"  >重置</button>
		</div>
    </div>
  </div>
   
  <fieldset class="layui-elem-field layui-field-title" style="width:550px">
    <legend align="center"></legend>
    <div class="layui-field-box layui-row" style="font-size: 12px;margin-left: 110px;">
  
	<div class="layui-col-md6">
  	已有账户？<a href="login.jsp">立即登录</a>
    </div>
	<div class="layui-col-md6">
	<a onclick="" style="float:right;margin-right: 50px;">忘记密码？</a>
	</div>
  </fieldset>
  
 
  <!-- 更多表单结构排版请移步文档左侧【页面元素-表单】一项阅览 -->
</form>
</div>
<script src="./layui/layui.js"></script>
<script src="js/registe.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>