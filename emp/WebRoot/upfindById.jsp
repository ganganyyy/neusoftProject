<%@ page language="java"   pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"     prefix="e" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<title>Insert title here</title>
<style type="text/css">
td
{
    height:30px;
}

</style>
</head>
<body>
<br>
${msg}
<br>

<form  action="<%=path%>/upmanage.html"  method="post">
<table class="layui-table" border="1"  align="center"  width="45%">
<caption>
  �鿴��������
  <hr width="160">
</caption>
<tr>
<td>����</td>
<td>
<e:text name="aag104" readonly="true" defval="${ins.aag104 }"/>
</td>
</tr>
<tr>
<td>����</td>
<td>
 <e:textarea rows="5" cols="45"  name="aag105" readonly="true" defval="${ins.aag105 }"/>
</td>
</tr>
<tr>
<td>������ַ</td>
<td>
<e:text name="aag106" readonly="true" defval="${ins.aag106 }" />
</td>
</tr>
<tr>
  <td  colspan="2" align="center" >
<input class="layui-btn" type="submit" name="next" value="ͨ��"
          formaction="passup.html">
<input class="layui-btn" type="submit" name="next" value="��ͨ��"
          formaction="nopassup.html">
<input class="layui-btn" type="submit" name="next" value="����"   >  
          </td> 
</tr>

</table>
<input type="hidden" name="aag101" value="${param.aag101}">
<input type="hidden" name="qaag104" value="${param.qaag104}">
<input type="hidden" name="qaag108" value="${param.qaag108}">
<input type="hidden" name="baag107" value="${param.baag107}">
<input type="hidden" name="eaag107" value="${param.eaag107}">
<input type="hidden"  name="aag107" value="${ins.aag107 }">
<input type="hidden"  name="aag102" value="${ins.aag102 }">
</form>

</body>
</html>