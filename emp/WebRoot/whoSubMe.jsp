<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
<title>Insert title here</title>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <link rel="stylesheet" href="define/css/stylegan.css" media="all">
 <link rel="stylesheet" href="css/test.css">
 <script type="text/javascript">
 function onDel(vaab203)
 {
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/delByIdSub.html?aab203="+vaab203;
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

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>关注我的人</legend>
</fieldset>  

<div class="layui-row layui-col-space15">

<c:if test="${rows!=null }">
<c:forEach items="${rows }" var="ins">

<div class="layui-col-md4 layui-col-sm6">
<div class="layadmin-contact-box">
<div class="layui-col-md4 layui-col-sm6">
<div class="layadmin-text-center">
      <img src="${ins.aab106 }">
</div>
</div>
<div class="layui-col-md8 layadmin-padding-left20 layui-col-sm6">
          <a href="javascript:;">
            <h3 class="layadmin-title" style="margin-top:25px">
              <strong>${ins.aab102 }</strong>
            </h3>
          </a>
          
</div>
</div>
</div>

</c:forEach>
</c:if>


</div> 

 
</form>

</div>
<script src="layui/layui.js" charset="utf-8"></script>
</body>
</html>