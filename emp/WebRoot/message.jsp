<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="layui/css/layui.css"  media="all">
<link rel="stylesheet" href="css/message.css">

</head>
<body>

<div class="layui-container" style="margin-top:50px;margin-left:10%; width:80%">

<div class="layui-row">
 <div class="layui-col-md3">
 <img src="img/head/photo1.jpg" class="head-img">
<ul class="layui-nav layui-nav-tree" lay-filter="test" >
 
    
  
<!-- <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 20px;">-->
 <li class="layui-nav-item" ><a href="" ><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  个人信息设置</a></li>
  <li class="layui-nav-item" ><a href="" ><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  修改头像</a></li>
    <li class="layui-nav-item layui-this" ><a href="" ><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  申请升级</a></li>
  <li class="layui-nav-item"><a href=""><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  系统消息</a></li>

</ul> 
 </div>

 <div class="layui-col-md9">
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>默认表格</legend>
</fieldset>
  <table class="layui-table">
    <colgroup>
      <col width="150">
      <col width="150">
      <col width="200">
      <col>
    </colgroup>
    <thead>
      <tr>
        <th>消息内</th>
        <th>民族</th>
        <th>出场时间</th>
        <th>格言</th>
      </tr> 
    </thead>
    <tbody>
      <tr>
        <td>贤心</td>
        <td>汉族</td>
        <td>1989-10-14</td>
        <td>人生似修行</td>
      </tr>
      <tr>
        <td>张爱玲</td>
        <td>汉族</td>
        <td>1920-09-30</td>
        <td>于千万人之中遇见你所遇见的人，于千万年之中，时间的无涯的荒野里…</td>
      </tr>
      <tr>
        <td>Helen Keller</td>
        <td>拉丁美裔</td>
        <td>1880-06-27</td>
        <td> Life is either a daring adventure or nothing.</td>
      </tr>
      <tr>
        <td>岳飞</td>
        <td>汉族</td>
        <td>1103-北宋崇宁二年</td>
        <td>教科书再滥改，也抹不去“民族英雄”的事实</td>
      </tr>
      <tr>
        <td>孟子</td>
        <td>华夏族（汉族）</td>
        <td>公元前-372年</td>
        <td>猿强，则国强。国强，则猿更强！ </td>
      </tr>
    </tbody>
  </table>
  </div>
</div>

          
<script src="layui/layui.js" charset="utf-8"></script>

</div>
</body>
</html>