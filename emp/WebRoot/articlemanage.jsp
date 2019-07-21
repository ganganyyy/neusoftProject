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
<!-- 查询 --> 
<table  class="layui-table" border="1"  width="60%" align="center" method="post"  >
   <caption>
     历史投稿
     
   <hr width="160px">
   </caption>
    <tr>
    <td colspan="4" align="center">查询条件</td>
    </tr>
    <tr>
    <td>文章标题</td>
    <td>
    <e:text name="qaag104"/>
     </td>
    <td>审核状态</td>
    <td> 
    <e:radio name="qaag108"  value="未通过:01 ,待审核:03 , 不限:''" defval=""/>
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
<table  class="layui-table" border="1"  width="60%" align="center">

    <tr>
    <td> </td>
    <td>序号 </td>
      
    <td>标题</td>
    <td>内容</td>
    <td>申请时间 </td>
    <td>审核状态 </td>
    <td>审核时间 </td>
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
    <a href="#" onclick="onDel('${ins.aag101}')"> 删除 </a>
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
<!-- 按钮 -->
<table  class="layui-table" border="1"  width="60%" align="center">
    <tr>
    <td align="center">
    <input class="layui-btn" type="submit"  name="next" value="查询">
    <input  class="layui-btn" type="submit"  name="next" value="已发布的文章"
     formaction="<%=path%>/myarticle.jsp"          >
    <input  class="layui-btn" type="submit"  name="next" value="发布新文章"
     formaction="<%=path%>/addarticle.jsp"          >
    <input class="layui-btn" type="submit"  id="del" name="next" value="删除" disabled="disabled"
                 formaction="<%=path%>/delarticle.html"  >
                 <input class="layui-btn" type="submit"  id="next" name="next" value="返回主页"
                       formaction="<%=path%>/mainPage.jsp"   >
     </td>
    </tr>

</table>
</form>
</body>
</html>