<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<title>Insert title here</title>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
 <link rel="stylesheet" href="define/css/stylegan.css" media="all">
 <link rel="stylesheet" href="css/message.css">
<script type="text/javascript">
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
 
    </script>
</head>
<body>
 <div class="layui-container" style="margin-top:50px;margin-left:20%; width:60%">
${msg}
<br>
<br>
<form id="myform" action="<%=path%>/upgrade.html" method="post">
<div class="layui-row">
 <div class="layui-col-md3" style="margin-top: 30px;">


 
<ul class="layui-nav layui-nav-tree" lay-filter="test" >

<!-- <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 20px;">-->
<li class="layui-nav-item" ><a href="personalInfo.jsp"><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  ������Ϣ����</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toPhoto();"><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  �޸�ͷ��</a></li>
<li class="layui-nav-item layui-this" ><a href="#" onclick="toUpgrade();"><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  ��������</a></li>
<li class="layui-nav-item"><a href="#" onclick="toMessage();"><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  ϵͳ��Ϣ</a></li>

</ul> 
 </div>
     
   <div class="layui-col-md9">        
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>��������</legend>
</fieldset>  
 
<table class="layui-table" lay-even="" lay-skin="row">
  <colgroup>
    <col width="150">
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>��ע��</th>
      <th>�ղ���</th>
      <th>������</th>
      <th>�ܷ�</th>
    </tr> 
  </thead>
  <tbody>
  <c:if test="${ins!=null }">
    <tr>
      <td>${ins.totallikes }</td>
      <td>${ins.totalcollects }</td>
      <td>${ins.totalsub }</td>
      <td>${ins.totallikes+ins.totalcollects+2*ins.totalsub }</td>
    </tr>
</c:if>
  </tbody>
</table>  
  <input type="submit" name="next" value="��������" style="border:0px;width: 120px;height: 50px;background: #DD3915;line-height: 50px;
font-size: 15px;color: #fff; margin-top:20px;float:right;">
</div>
</div>
</form>

</div>
<script src="layui/layui.js" charset="utf-8"></script>
</body>
</html>