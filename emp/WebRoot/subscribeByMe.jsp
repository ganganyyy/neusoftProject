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
 function onDel(vaab201,vaab101)
 {
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/delByIdSub.html?aab201="+vaab201+"&aab101="+vaab101;
	 vform.submit();
 }
 function onGo(vaab101)
 {
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/queryHomeRecipe.html?aab101="+vaab101;
	 vform.submit();
 } 
 </script>
</head>
<body>
 <div class="layui-container" style="margin-top:50px;margin-left:20%; width:60%">
${msg}
<br>
<br>
<form id="myform" method="post">

<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>关注的人列表</legend>
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
          <a href="#" onclick="onGo('${ins.aab101}')">
            <h3 class="layadmin-title">
              <strong>${ins.aab102 }</strong>
            </h3>
          </a>
          <c:if test="${sessionScope.aab101Self==param.aab101 }">
          <button class="layui-btn layui-btn-sm caller-fr" onclick="onDel('${ins.aab201}','${ins.aab101}')">
            <i class="layui-icon layui-icon-close"></i>
             取消关注
          </button>
          </c:if>
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