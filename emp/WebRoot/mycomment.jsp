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
<!-- 查询 --> 
<table class="layui-table"  border="1"  width="80%" align="center" method="post"  >
   <caption>
     我的评论
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">查询条件</td>
    </tr>
    <tr>
    <td>评论内容</td>
    <td>
    <e:text name="qaad404"/>
     </td>
    <td>评论类型</td>
    <td> 
    <e:radio name="qaad402"  value="食谱:01 ,作品:02, 专栏文章:03 , 不限:''" defval=""/>
    </td>
    </tr>
    
</table>
<!-- 显示 -->
<table class="layui-table"  border="1"  width="80%" align="center">

    <tr>
    <td> </td>
    <td>序号 </td>     
    <td>评论内容</td>
    <td>评论类型 </td>
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
    <a href="#" style="color:red" onclick="onDel('${ins.aad401}')"> 删除 </a>
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
<!-- 按钮 -->
<table class="layui-table"  border="1"  width="80%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  name="next" value="查询">
    <input class="layui-btn" type="submit"  id="del" name="next" value="删除" disabled="disabled"
                 formaction="<%=path%>/delcomment.html"  >
     </td>
    </tr>

</table>
</form>
</body>
</html>