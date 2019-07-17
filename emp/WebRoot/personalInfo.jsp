<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>

<html>

	<head>
		<meta charset="UTF-8" />
		<title>个人信息管理</title>
		<link rel="stylesheet" type="text/css" href="css/main.css" />
		<link rel="stylesheet" type="text/css" href="css/profile.css" />
		<link rel="stylesheet" href="layui/css/layui.css"/>
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
	</script>
	</head>

	<body>
	${msg }
    
    <div class="layui-container" style="margin-top:100px;margin-left:30%; width:40%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>修改个人信息</legend>
</fieldset>
 
<form class="layui-form" action="<%=path%>/updateInfo.html" method="post">

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
      <button class="layui-btn" lay-submit="" lay-filter="demo1">修改个人信息</button>
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