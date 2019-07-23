<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
    <html>
    <head>
    
    <title>Insert title here</title>
    <script type="text/javascript">
    function onEdit(vaae101)
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/queryVoteDetail.html?aae101="+vaae101;
  	 vform.submit();
    } 
    function open(vmsg)
    {
    	alert(vmsg);	
    }

    </script>
     <link rel="stylesheet" href="layui/css/layui.css"  media="all">
     <link rel="stylesheet" href="define/css/stylegan.css" media="all">
    </head>
    <c:if test="${msg!=null }">
    <body onload="open('${msg}');">
    </c:if>
    <c:if test="${msg==null }">
    <body>
    </c:if>
    <div class="layui-container" style="margin-top:80px;margin-left:20%; width:60%">
    <form id="myform" action="<%=path%>/queryAllVote.html" method="post">
    
    <fieldset class="layui-elem-field layui-field-title" style="margin-top: 100px;">
  <legend>查看所有活动</legend>
</fieldset>  

<table class="layui-table" lay-even="" lay-skin="row">
  <colgroup>
    <col width="100">
    <col width="350">
    <col width="150">
    <col width="150">
  </colgroup>
  <thead>
    <tr>
      <th>活动名称</th>
      <th>活动内容</th>
      <th>开始时间</th>
      <th>结束时间</th>
    </tr> 
  </thead>
  <tbody>
  <c:if test="${rows!=null }">
   <c:forEach items="${rows }" var="ins" varStatus="vs">
    <tr>
      <td><a herf="#" onclick="onEdit('${ins.aae101}')" 
      style="color: #809cd2;font-weight: bold;cursor: pointer;">${ins.aae102 }</a></td>
      <td>${ins.aae103 }</td>
      <td>${ins.aae104 }</td>
      <td>${ins.aae105 }</td>
    </tr>
    </c:forEach>
</c:if>
  </tbody>
</table>  

      <input type="submit" class="layui-btn layui-btn-sm layui-btn-green-fr" name="next" value="查询所有活动">
	</form>
	
	</div>
<script src="layui/layui.js" charset="utf-8"></script>
	</body>	
</html>