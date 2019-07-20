<%@ page language="java"  pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"     prefix="e" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<style type="text/css">
td
{
    height:30px;
}


</style>
</head>
<body>
<br>
${msg }
<br>

<form action="<%=path%>/addarticle.html"  method="post"   >


<table class="layui-table" border="1"  align="center"  width="45%">
<caption>
  文章${empty param.aag101?'发布':'修改'}

</caption>
   
    <tr>
    <td>标题 </td>
    <td>
    <e:text name="aag104" required="true" autofocus="true"  defval="${ins.aag104 }"/>
     </td>
    </tr>
    <tr>
    <td>内容 </td>
    
    <td> 
    <e:textarea rows="5" cols="45"  name="aag105" required="true" defval="${ins.aag105}"/>
     </td>
    </tr>
    
    
    <tr>
    <td  colspan="2" align="center" >
    <input  class="layui-btn" type="submit" name="next"  value="${empty param.aag101?'发布':'修改'}"
                 formaction="<%=path%>/${empty param.aag101?'add':'modify'}article.html">
    <input  class="layui-btn" type="submit" name="next"  value="返回我的投稿"
        formaction="<%=path%>/articlemanage.html" 
        formnovalidate="formnovalidate"  >
        <input class="layui-btn"  type="submit" name="next"  value="返回浏览页"
        formaction="<%=path%>/browsearticle.jsp" 
        formnovalidate="formnovalidate"  >
    </td>   
    </tr>

</table>

<input type="hidden" name="aag101" value="${param.aag101}">
<input type="hidden" name="qaag104" value="${param.qaag104}">
<input type="hidden" name="qaag108" value="${param.qaag108}">
<input type="hidden" name="baag107" value="${param.baag107}">
<input type="hidden" name="eaag107" value="${param.eaag107}">
</form>

</body>
</html>