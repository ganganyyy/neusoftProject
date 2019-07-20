<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"     prefix="e" %>
<%@  taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@  taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
<link rel="stylesheet" href="css/collection/common.css">
<script src="js/collection/jquery-1.9.1.min.js" type="text/javascript" charset="GBK"></script>
<script src="js/collection/common.js" type="text/javascript" charset="GBK"></script>
<script src="js/collection/user.js" type="text/javascript" charset="GBK"></script>


<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
<script src="layui/layui.js"></script>
<title>Insert title here</title>
<style type="text/css">
td
{
    height:30px;
    white-space: nowrap;
}

</style>
</head>
<body>
<br>
${msg }
<br>

<form  action="<%=path%>/addarticle.jsp"  method="post" >





<!-- 显示数据 -->
<table class="layui-table"   align="center"  width="45%" >

<tr>
<td >标题    </td>
<td >
<e:textarea rows="1" cols="100"  name="aac302" readonly="true" defval="${ins.aac302 }"/>
</td>
<tr>
<td>作者</td>
<td>
<e:textarea rows="1" cols="100"  name="staac306" readonly="true" defval="${ins.staac306 }"/>
</td>

<tr>
<td>内容</td>
<td>
<e:textarea rows="15" cols="100"  name="aac303" readonly="true" defval="${ins.aac303}" />
</td>
</tr>


</table >

<!-- 点赞收藏评论 -->
<table class="layui-table" align="center"  width="45%">
           <tr>
           <td colspan="2" align="center">
  <input class="layui-btn" type="submit" name="next" value="${empty ab02.aab201?'关注':'取消关注' } "
          formaction="<%=path%>/${empty ab02.aab201?'guanzhu':'quxiaoguanzhu' }.html"    
           formnovalidate="formnovalidate">
<input class="layui-btn" type="submit" name="next" value="${empty ad01.aad101?'点赞':'取消点赞' }"
          formaction="<%=path%>/${empty ad01.aad101?'dianzan':'quxiaodianzan' }.html" 
          formnovalidate="formnovalidate">       
<input class="layui-btn" type="submit" name="next" value="收藏"
          formaction=""    
            formnovalidate="formnovalidate">
          </td>
          </tr>
      <tr>
      <td>评论</td>
     <td >
      <e:textarea rows="7" cols="100" required="true" name="aad404" readonly="false" defval=""/>
     </td>
      </tr>  
      <tr>
      <td colspan="2"  align="center">
      <input class="layui-btn" type="submit" name="next" value="发表评论"
          formaction="<%=path%>/articlecomment.html">
      </td>
      </tr>         
</table>

<!-- 显示评论 -->
<table  class="layui-table" border="1"  width="60%" align="center">

    <tr> 
    <td>头像</td>
    <td>用户 </td>
    <td>评论内容</td>    
    </tr>
          <c:forEach items="${comment }" var="ins"  varStatus="vs">
    <tr>
    <td><img  src="${ins.aab106 }">  </td>     
    <td>${ins.staad405}</td>  
    <td>${ins.aad404 }</td> 
    </tr>  
          </c:forEach>
         
</table>

<!-- 返回   -->
<table  class="layui-table" align="center"  width="45%">
<tr>
<td coslpan="2" align="center">
<input class="layui-btn" type="submit" name="next" value="我也要写"
          formaction="addarticle.jsp"
          formnovalidate="formnovalidate">
<input class="layui-btn" type="submit" name="next" value="返回"
          formaction="userquery.html"
          formnovalidate="formnovalidate">
          </td>
          </tr>
</table>
<input type="hidden" name="aac301" id="aac301" value="${param.aac301 }">
<input type="hidden" name="aac306" id="aac306" value="${ins.aac306 }">
<input type="hidden" name="aad101" id="aad101" value="${ad01.aad101 }">
<input type="hidden" name="aab201" id="aab201" value="${ab02.aab201 }">
<input type="hidden" name="qaac302" value="${param.qaac302}">
<input type="hidden" name="baac305" value="${param.baac305}">
<input type="hidden" name="eaac305" value="${param.eaac305}">
</form>
</body>
</html>