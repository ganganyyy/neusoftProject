<%@ page language="java"   pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"     prefix="e" %>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<% String path=request.getContextPath(); %>
<html>
<head>
<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<style>
  tr{
   height:30px;
  }
</style>
<title>Insert title here</title>
<script type="text/javascript">
 count=0;
  
     function onEdit(vaag101)
     {
    	 var vform=document.getElementById("myform");
    	 vform.action="<%=path%>/upfindById.html?aag101="+vaag101;
    	 //alert(vform.action);
    	 vform.submit();
     }
    
     function submitForm()
     {
         document.getElementById("myform").submit();	   
     }

</script>


</head>
<body>
<br>
${msg}
<br>
<br>

<form  name="myform" id="myform" action="<%=path%>/upmanage.html" method="post">
<!-- ��ѯ --> 
<table  class="layui-table" border="1"  width="95%" align="center" method="post">
   <caption>
     �����������
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">��ѯ����</td>
    </tr>
    <tr>
    <td>����</td>
    <td>
    <e:text name="qaag104"/>
     </td>
    <td>���״̬</td>
    <td> 
    <e:radio name="qaag108"  value="δͨ��:01 , �����:03 , ����:''" defval=""/>
    </td>
    </tr>
    <tr>
    <td>����ʱ��[B]</td>
    <td> 
    <e:date name="baag107"/>
    </td>
    <td>����ʱ��[E] </td>
    <td>
    <e:date name="eaag107"/>
     </td>
    </tr>

</table>
<!-- ��ʾ -->
<table class="layui-table"  border="1"  width="95%" align="center">

    <tr>
    
    <td>��� </td>
    <td>�û���</td>   
    <td>����</td>
    <td>����</td>
    <td>���� </td>
    <td>����ʱ�� </td>
    <td>���״̬</td>
    
    </tr>
    <c:choose>
       <c:when test= "${rows!=null }" >
          <c:forEach items="${rows }" var="ins"  varStatus="vs">
    <tr>
    
    <td>${vs.count }</td>
    <td>${ins.staag102 }</td>
    <td>
    <a href="#" style="color:red"  onclick="onEdit('${ins.aag101}')">${ins.aag104 }</a>
    </td>
    <td class="award-name">${ins.aag105 }</td>
    <td class="award-name">${ins.aag106 }</td>
    <td>${ins.aag107 }</td>
    <td>${ins.staag108 }</td>

    
    </tr>  
          </c:forEach>
          <c:forEach begin="${fn:length(rows)+1 }" step="1" end="15">
          <tr>
      
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>  
      <td></td>
      <td></td>
      
      
      </tr>
          </c:forEach>
      </c:when>
      <c:otherwise>
      <c:forEach begin="1" step="1" end="15">
      <tr>
      
      <td></td>
      <td></td>
      <td></td>
      <td></td>
      <td></td>    
      <td></td>
      <td></td>
     
      
      </tr>
      </c:forEach>
      </c:otherwise>
    </c:choose>
</table>
<!-- ��ť -->
<table  class="layui-table" border="1"  width="95%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  id="next" name="next" value="��ѯ">
   
     </td>
    </tr>

</table>




</form>


</body>
</html>