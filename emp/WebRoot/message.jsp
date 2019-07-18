<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<title>ϵͳ��Ϣ</title>
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
<div class="layui-container" style="margin-top:90px;margin-left:10%; width:80%">
<form id="myform" action="<%=path%>/queryEvent.html" method="post">
<div class="layui-row">
 <div class="layui-col-md3" style="margin-top: 30px;">

 <img src="${ins.aab106 }" class="head-img">
 
<ul class="layui-nav layui-nav-tree" lay-filter="test" >

<!-- <ul class="layui-nav layui-nav-tree layui-nav-side" style="margin-top: 20px;">-->
<li class="layui-nav-item" ><a href="personalInfo.jsp"><i class="layui-icon layui-icon-set" style="font-size: 20px; color: #89bcaf;"></i>  ������Ϣ����</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toPhoto();"><i class="layui-icon layui-icon-picture-fine" style="font-size: 20px; color: #89bcaf;"></i>  �޸�ͷ��</a></li>
<li class="layui-nav-item" ><a href="#" onclick="toUpgrade();"><i class="layui-icon layui-icon-diamond" style="font-size: 20px; color: #89bcaf;"></i>  ��������</a></li>
<li class="layui-nav-item layui-this"><a href="#" onclick="toMessage();"><i class="layui-icon layui-icon-notice" style="font-size: 20px; color: #89bcaf;"></i>  ϵͳ��Ϣ</a></li>

</ul> 
 </div>

 <div class="layui-col-md9">
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>ϵͳ��Ϣ</legend>
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
        <th>ѡ��</th>
        <th>��Ϣ����</th>
        <th>��Ϣʱ��</th>
        <th>�鿴״̬</th>
        <th>ɾ��</th>
      </tr> 
    </thead>
    <c:if test="${rows!=null }">
    <c:forEach items="${rows }" var="ins" varStatus="vs">
    <tbody>
      <tr>
        <td>${ins.aab301 }</td>
        <td>${ins.aab302 }</td>
        <td>${ins.aab303 }</td>
        <td>${ins.aab304 }</td>
      </tr>

   

    </tbody>
    </c:forEach>
    </c:if>
  </table>
  </div>
  
</div>
</form>
          
<script src="layui/layui.js" charset="utf-8"></script>

</div>
</form>
</body>
</html>