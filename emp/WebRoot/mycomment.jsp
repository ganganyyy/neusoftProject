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
     function onDel(vaad401)
     {
    	 var vform=document.getElementById("myform");
    	 vform.action="<%=path%>/delByIdcomment.html?aad401="+vaad401;
    	 vform.submit();
     }
    
     
</script>
</head>
<body>
${msg }
<br>
<br>
<form id="myform" action="<%=path%>/mycomment.html" method="post">
<!-- ��ѯ --> 
<table class="layui-table"  border="1"  width="80%" align="center" method="post"  >
   <caption>
     �ҵ�����
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">��ѯ����</td>
    </tr>
    <tr>
    <td>��������</td>
    <td>
    <e:text name="qaad404"/>
     </td>
    <td>��������</td>
    <td> 
    <e:radio name="qaad402"  value="ʳ��:01 ,��Ʒ:02, ר������:03 , ����:''" defval=""/>
    </td>
    </tr>
    
</table>
<!-- ��ʾ -->
<table class="layui-table"  border="1"  width="80%" align="center">

    <tr>
    <td> </td>
    <td>��� </td>     
    <td>��������</td>
    <td>�������� </td>
    <td> </td>
    </tr>
    <c:choose>
       <c:when test= "${rows!=null }" >
          <c:forEach items="${rows }" var="ins"  varStatus="vs">
    <tr>
    <td>
    <input type="checkbox"  name="idlist"  value="${ins.aad401}"
                          onclick="onSelect(this.checked)" >
    </td>
    <td>${vs.count }</td>  
    <td class="award-name">
    ${ins.aad404 }
    </td>   
    <td>${ins.staad402}</td>
    <td>
    <a href="#" style="color:red" onclick="onDel('${ins.aad401}')"> ɾ�� </a>
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
      </tr>
      </c:forEach>
      </c:otherwise>
    </c:choose>
</table>
<!-- ��ť -->
<table class="layui-table"  border="1"  width="80%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  name="next" value="��ѯ">
    <input class="layui-btn" type="submit"  id="del" name="next" value="ɾ��" disabled="disabled"
                 formaction="<%=path%>/delcomment.html"  >
     </td>
    </tr>

</table>
</form>
</body>
</html>