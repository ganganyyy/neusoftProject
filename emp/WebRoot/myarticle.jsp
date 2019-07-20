<%@ page language="java" import ="java.util.*" pageEncoding="GBK" %>
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
  
  a:link,a:visited{
 text-decoration:none;  /*���������»���*/
}
a:hover{
 text-decoration:underline;  /*������ȥ���»���*/
}
  
  
table{table-layout: fixed;word-break: break-all; word-wrap: break-word; //���̶�����}
 .award-name{-o-text-overflow:ellipsis;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width:100%; //����������ʾʡ�Ժ�}
  
</style>


<title>Insert title here</title>
<script type="text/javascript">
count=0;
   
     function onEdit(vaac301)
     {
    	 var vform=document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdmyarticle.html?aac301="+vaac301;
    	 //alert(vform.action);
    	 vform.submit();
     }
   
</script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/myarticle.html" method="post">
<!-- ��ѯ --> 
<table  class="layui-table" border="1"  width="60%" align="center" method="post"  >
   <caption>
     �ѷ�������
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">��ѯ����</td>
    </tr>
    <tr>
    <td>���±���</td>
    <td>
    <e:text name="qaac302"/>
     </td>
    </tr>
    <tr>
    <td>����ʱ��[B]</td>
    <td> 
    <e:date name="baac305"/>
    </td>
    <td>����ʱ��[E] </td>
    <td>
    <e:date name="eaac305"/>
     </td>
    </tr>

</table>
<!-- ��ʾ -->
<table class="layui-table"  border="1"  width="60%" align="center">

    <tr>
    <td>��� </td>   
    <td>����</td>
    <td>����</td>
    <td>����ʱ�� </td>
    <td>������</td>
    <td>�ղ���</td>

    </tr>
    <c:choose>
       <c:when test= "${rows!=null }" >
          <c:forEach items="${rows }" var="ins"  varStatus="vs">
    <tr>
    <td>${vs.count }</td>
    
    <td>
    <a href="#" style="color:red" onclick="onEdit('${ins.aac301}')">${ins.aac302 }</a>
    </td>
    <td  class="award-name"> ${ins.aac303}</td>
    <td>${ins.aac305 }</td>
    <td>${ins.aac308 }</td>
    <td>${ins.aac309 }</td>
    
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
      </tr>
      </c:forEach>
      </c:otherwise>
    </c:choose>
</table>
<!-- ��ť -->
<table class="layui-table"  border="1"  width="60%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  name="next" value="��ѯ">
    <input class="layui-btn" type="submit"  name="next" value="����������"
     formaction="<%=path%>/addarticle.jsp"          >

     </td>
    </tr>

</table>
</form>
</body>
</html>