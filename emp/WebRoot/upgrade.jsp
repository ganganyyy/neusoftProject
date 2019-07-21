<!-- author:���ɺ -->
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
    <body onload="open('${msg}');">
    </c:if>
    <c:if test="${msg==null }" >
    <body>
    </c:if>
 <div class="layui-container" style="margin-top:90px;margin-left:10%; width:80%">

<form id="myform" action="<%=path%>/upgrade.html" method="post">
<div class="layui-row">
 <div class="layui-col-md3" style="margin-top: 30px;">


 <img src="${photo.aab106 }" class="head-img">
<ul class="layui-nav layui-nav-tree" lay-filter="test" >

<!-- <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 20px;">-->
<li class="layui-nav-item" ><a href="#" onclick="toInfo();"><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  ������Ϣ����</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toPhoto();"><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  �޸�ͷ��</a></li>
<li class="layui-nav-item layui-this" ><a href="#" onclick="toUpgrade();"><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  ��������</a></li>
<li class="layui-nav-item"><a href="#" onclick="toMessage();"><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  ϵͳ��Ϣ</a></li>

</ul>
 </div>

   <div class="layui-col-md9">
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
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
      <th>��ע��(2��)</th>
      <th>�ղ���(1��)</th>
      <th>������(1��)</th>
      <th>�ܷ�</th>
    </tr>
  </thead>
  <tbody>
  <c:if test="${ins!=null }">
    <tr>
      <td>${ins.totalsub }</td>
      <td>${ins.totalcollects }</td>
      <td>${ins.totallikes }</td>
      <td>${ins.totallikes+ins.totalcollects+2*ins.totalsub }</td>
    </tr>
</c:if>
  </tbody>
</table>
<blockquote class="layui-elem-quote layui-quote-nm" style="color:#969191;">�ֳܷ���500�ּ�������������Ϊ��ʳ��V</blockquote>
  <input type="submit" name="next" value="��������" style="border:0px;width: 100px;height: 40px;background: #89bcaf;
font-size: 14px;color: #fff; margin-top:1px;float:right;">
</div>
</div>
</form>

</div>
<script src="layui/layui.js" charset="utf-8"></script>
</body>
</html>