<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
    <html>
    <head>
    <title>Insert title here</title>
    <script type="text/javascript">
    function onEdit(vaae101)
    {
  	 var vform = document.getElementById("myform");
  	 vform.action="<%=path%>/queryVoteDetail.html?aae101="+vaae101;
  	 //alert(vform.action);
  	 vform.submit();
    } 
    </script>
    
    </head>
    
    <body>
    ${msg}
    <br>
    
    <form id="myform" action="<%=path%>/queryAllVote.html" method="post">
    <!-- ���ݵ����� -->
	<table border="1" width="95%" align="center">
	  <tr>
	    
	    <td>�����</td>
	    <td></td>
	  </tr>
	  <!--
	         ע������
	    1.$�������ŵĽ������ }��˫����֮��,��������ֿո�
	    2.���е�����֮������Ҫ��һ���ո�,���򱨴�
	    3.var ����,�൱����ҳ�涨���������,���  ins����������$ {  }
	   -->
	   
	     <c:if test="${rows!=null }">
	     
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	  <tr>
				   
				    
				   
				    <td>
				      <a href="#" onclick="onEdit('${ins.aae101}')">${ins.aae102 }</a>
				    </td>
				  </tr>
		      </c:forEach>
		      
		     </c:if>
	   
	</table>
      <input type="submit" name="next" value="��ѯ���л">
	</form>
	</body>	
</html>