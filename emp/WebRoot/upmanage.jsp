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
<!-- 查询 --> 
<table  class="layui-table" border="1"  width="95%" align="center" method="post">
   <caption>
     审核升级申请
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">查询条件</td>
    </tr>
    <tr>
    <td>标题</td>
    <td>
    <e:text name="qaag104"/>
     </td>
    <td>审核状态</td>
    <td> 
    <e:radio name="qaag108"  value="未通过:01 , 待审核:03 , 不限:''" defval=""/>
    </td>
    </tr>
    <tr>
    <td>申请时间[B]</td>
    <td> 
    <e:date name="baag107"/>
    </td>
    <td>申请时间[E] </td>
    <td>
    <e:date name="eaag107"/>
     </td>
    </tr>

</table>
<!-- 显示 -->
<table class="layui-table"  border="1"  width="95%" align="center">

    <tr>
    
    <td>序号 </td>
    <td>用户名</td>   
    <td>标题</td>
    <td>内容</td>
    <td>附件 </td>
    <td>申请时间 </td>
    <td>审核状态</td>
    
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
<!-- 按钮 -->
<table  class="layui-table" border="1"  width="95%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  id="next" name="next" value="查询">
   
     </td>
    </tr>

</table>




</form>


</body>
</html>