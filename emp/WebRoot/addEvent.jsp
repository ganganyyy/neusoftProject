<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<title>添加活动</title>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
 <link rel="stylesheet" href="define/css/stylegan.css" media="all">
</head>
<body>

<br>
<br>

 <div class="layui-container" style="margin-top:50px;margin-left:20%; width:60%">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>添加活动</legend>
</fieldset>
 
<form class="layui-form" action="<%=path%>/addEvent.html" method="post">

  <div class="layui-form-item">
    <label class="layui-form-label">活动名称</label>
    <div class="layui-input-block">
      <input type="text" name="aae102" lay-verify="required" autocomplete="off" placeholder="请输入标题" class="layui-input">
    </div>
  </div>
  
 
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">开始日期</label>
      <div class="layui-input-inline">
        <input type="text" name="aae104" id="start" lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">结束日期</label>
      <div class="layui-input-inline">
        <input type="text" name="aae105" id="end" lay-verify="required" placeholder="yyyy-MM-dd HH:mm:ss" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">活动类型</label>
    <div class="layui-input-block">
      <input type="radio" name="aae107" value="1" title="无活动作品" checked="">
      <input type="radio" name="aae107" value="2" title="有活动作品">
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">活动内容</label>
    <div class="layui-input-block">
      <textarea name="aae103" placeholder="请输入内容" lay-verify="required" class="layui-textarea"></textarea>
    </div>
  </div>
  
  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="" lay-filter="demo1">添加活动</button>
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

//日期时间选择器
 laydate.render({
            elem: '#date',
            type: 'datetime',
            calendar: true,	
            min: nowTime
           
        });
 laydate.render({
            elem: '#date2',
            type: 'datetime',
            min: '${aae104}'
        });
 var startTime=laydate.render({
 	elem:'#start',
 	type:'datetime',
 	btns: ['confirm'],
 	min:nowTime,//默认最大值为当前日期
 	done:function(value,date){
// 		console.log(value); //得到日期生成的值，如：2017-08-18
// 	    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
 	    endTime.config.min={    	    		
 	    	year:date.year,
 	    	month:date.month-1,//关键
             date:date.date,
             hours:date.hours,
             minutes:date.minutes,
             seconds:date.seconds
 	    };
 	    
 	}
 })
 var endTime=laydate.render({
 	elem:'#end',
 	type:'datetime',
 	btns: ['confirm'],
 	//min:'nowTime',
 	done:function(value,date){
// 		console.log(value); //得到日期生成的值，如：2017-08-18
// 	    console.log(date); //得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}    	   
 	    startTime.config.max={
 	    		year:date.year,
     	    	month:date.month-1,//关键
                 date:date.date,
                 hours:date.hours,
                 minutes:date.minutes,
                 seconds:date.seconds
 	    }
 	    
 	}
 })

  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');

  
  
});
</script>
</body>
</html>