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
  <legend>��ӻ</legend>
</fieldset>
 
<form class="layui-form" action="<%=path%>/addEvent.html" method="post">

  <div class="layui-form-item">
    <label class="layui-form-label">�����</label>
    <div class="layui-input-block">
      <input type="text" name="aae102" autocomplete="off" placeholder="���������" class="layui-input">
    </div>
  </div>
  
 
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">��ʼ����</label>
      <div class="layui-input-inline">
        <input type="text" name="aae104" id="date"  placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">��������</label>
      <div class="layui-input-inline">
        <input type="text" name="aae105" id="date2"  placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">�����</label>
    <div class="layui-input-block">
      <input type="radio" name="aae107" value="1" title="�޻��Ʒ" checked="">
      <input type="radio" name="aae107" value="2" title="�л��Ʒ">
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">�����</label>
    <div class="layui-input-block">
      <textarea name="aae103" placeholder="����������" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">��ӻ</button>
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
  var nowTime = new Date().valueOf();

//����ʱ��ѡ����
 laydate.render({
            elem: '#date',
            type: 'datetime',
            calendar: true,
            min: nowTime,
            done: function(value, date, endDate){
                end.config.min = {
                    year: date.year,
                    month: date.month - 1,
                    date: date.date,
                    hours: date.hours,
                    minutes: date.minutes,
                    seconds: date.seconds
                }
            }
        });
        laydate.render({
            elem: '#date2',
            type: 'datetime',
        });
 

  //����һ���༭��
  var editIndex = layedit.build('LAY_demo_editor');

  
  
});
</script>
</body>
</html>