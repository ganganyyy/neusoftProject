<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>��ӻ</title>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
</head>
<body>

${msg}
<br>
<br>

 <div class="layui-container" style="margin-top:50px;margin-left:20%; width:60%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>��ӻѡ��</legend>
</fieldset>
 
<form class="layui-form" action="<%=path%>/addEventOption.html" method="post">

  <div class="layui-form-item">
    <label class="layui-form-label">ѡ��1</label>
    <div class="layui-input-block">
      <input type="text" name="1aae203" autocomplete="off" placeholder="������ѡ��1" class="layui-input">
    </div>
  </div>
  
   <div class="layui-form-item">
    <label class="layui-form-label">ѡ��2</label>
    <div class="layui-input-block">
      <input type="text" name="2aae203" autocomplete="off" placeholder="������ѡ��2" class="layui-input">
    </div>
  </div>
 
  
  
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">��ӻѡ��</button>
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
  
  //����һ���༭��
  var editIndex = layedit.build('LAY_demo_editor');
  
});
</script>
</body>
</html>
