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
     function onSelect(vstate)
     {
    	 vstate?count++:count--;
    	// alert(count);
    	var vdel= document.getElementById("del");
    	vdel.disabled=(count==0);
     }
     function onEdit(vaag101)
     {
    	 var vform=document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdarticle.html?aag101="+vaag101;
    	 //alert(vform.action);
    	 vform.submit();
     }
     function onDel(vaag101)
     {
    	 var vform=document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdarticle.html?aag101="+vaag101;
    	 vform.submit();
     }
    
     
</script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/articlemanage.html" method="post" >
<!-- ��ѯ --> 
<table  class="layui-table" border="1"  width="60%" align="center" method="post"  >
   <caption>
     ��ʷͶ��
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">��ѯ����</td>
    </tr>
    <tr>
    <td>���±���</td>
    <td>
    <e:text name="qaag104"/>
     </td>
    <td>���״̬</td>
    <td> 
    <e:radio name="qaag108"  value="δͨ��:01 ,�����:03 , ����:''" defval=""/>
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
<table  class="layui-table" border="1"  width="60%" align="center">

    <tr>
    <td> </td>
    <td>��� </td>
      
    <td>����</td>
    <td>����</td>
    <td>����ʱ�� </td>
    <td>���״̬ </td>
    <td>���ʱ�� </td>
    <td> </td>
    </tr>
    <c:choose>
       <c:when test= "${rows!=null }" >
          <c:forEach items="${rows }" var="ins"  varStatus="vs">
    <tr>
    <td>
    <input type="checkbox"  name="idlist"  value="${ins.aag101}"
                          onclick="onSelect(this.checked)" >
    </td>
    <td>${vs.count }</td>
    
    <td>
    <a href="#" style="color:red" onclick="onEdit('${ins.aag101}')">${ins.aag104 }</a>
    </td>
    <td  class="award-name"> ${ins.aag105}</td>
    <td>${ins.aag107 }</td>
    <td>${ins.staag108 }</td>
    <td>${ins.aag109 }</td>
    <td>
    <a href="#" onclick="onDel('${ins.aag101}')"> ɾ�� </a>
    </td>
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
      <td></td>
      </tr>
      </c:forEach>
      </c:otherwise>
    </c:choose>
</table>
<!-- ��ť -->
<table  class="layui-table" border="1"  width="60%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  name="next" value="��ѯ">
    <input  class="layui-btn" type="submit"  name="next" value="����������"
     formaction="<%=path%>/addarticle.jsp"          >
    <input class="layui-btn" type="submit"  id="del" name="next" value="ɾ��" disabled="disabled"
                 formaction="<%=path%>/delarticle.html"  >
     </td>
    </tr>

</table>
</form>
</body>
</html>