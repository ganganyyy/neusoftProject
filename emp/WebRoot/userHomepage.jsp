<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
${msg}
<br>
<br>
<form action="<%=path%>/upgradeCount.html?aae101="+${aab101Self}" method="post">

     <input type="submit" name="next" value="查看用户分数">
     <input type="submit" name="next" value="获取所有我关住的人" 
      formaction="<%=path%>/queryAllSubscribe.html?aab101=3">
	 <input type="submit" name="next" value="获取所有关住我的人" 
      formaction="<%=path%>/querySubMe.html?aab101=3">
     <input type="submit" name="next" value="我的个人主页" 
      formaction="<%=path%>/queryHomeRecipe.html?aab101=1">
      <input type="submit" name="next" value="我的个人消息" 
      formaction="<%=path%>/queryMessage.html?aab101=1">     
  
</form>
</body>
</html>