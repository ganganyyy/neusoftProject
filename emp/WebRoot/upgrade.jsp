<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
 <link rel="stylesheet" href="layui/css/layui.css"  media="all">

</head>
<body>
 <div class="layui-container" style="margin-top:50px;margin-left:20%; width:60%">
${msg}
<br>
<br>
<form action="<%=path%>/upgrade.html" method="post">

     
           
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 50px;">
  <legend>申请升级</legend>
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
      <th>关注数</th>
      <th>收藏数</th>
      <th>点赞数</th>
      <th>总分</th>
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
  <input type="submit" name="next" value="申请升级" style="border:0px;width: 120px;height: 50px;background: #DD3915;line-height: 50px;
font-size: 15px;color: #fff; margin-top:20px;float:right;">
</form>

</div>
<script src="layui/layui.js" charset="utf-8"></script>
</body>
</html>