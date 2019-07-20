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
 text-decoration:none;  /*超链接无下划线*/
}
a:hover{
 text-decoration:underline;  /*鼠标放上去有下划线*/
}
  
  
table{table-layout: fixed;word-break: break-all; word-wrap: break-word; //表格固定布局}
 .award-name{-o-text-overflow:ellipsis;text-overflow:ellipsis;overflow:hidden;white-space:nowrap;width:100%; //超出部分显示省略号}
  
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
<!-- 查询 --> 
<table  class="layui-table" border="1"  width="60%" align="center" method="post"  >
   <caption>
     已发布文章
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">查询条件</td>
    </tr>
    <tr>
    <td>文章标题</td>
    <td>
    <e:text name="qaac302"/>
     </td>
    </tr>
    <tr>
    <td>发布时间[B]</td>
    <td> 
    <e:date name="baac305"/>
    </td>
    <td>发布时间[E] </td>
    <td>
    <e:date name="eaac305"/>
     </td>
    </tr>

</table>
<!-- 显示 -->
<table class="layui-table"  border="1"  width="60%" align="center">

    <tr>
    <td>序号 </td>   
    <td>标题</td>
    <td>内容</td>
    <td>发布时间 </td>
    <td>点赞数</td>
    <td>收藏数</td>

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
<!-- 按钮 -->
<table class="layui-table"  border="1"  width="60%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  name="next" value="查询">
    <input class="layui-btn" type="submit"  name="next" value="发布新文章"
     formaction="<%=path%>/addarticle.jsp"          >

     </td>
    </tr>

</table>
</form>
</body>
</html>