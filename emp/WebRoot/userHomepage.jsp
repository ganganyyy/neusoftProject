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

     <input type="submit" name="next" value="�鿴�û�����">
     <input type="submit" name="next" value="��ȡ�����ҹ�ס����" 
      formaction="<%=path%>/queryAllSubscribe.html?aab101=3">
	 <input type="submit" name="next" value="��ȡ���й�ס�ҵ���" 
      formaction="<%=path%>/querySubMe.html?aab101=3">
     <input type="submit" name="next" value="�ҵĸ�����ҳ" 
      formaction="<%=path%>/queryHomeRecipe.html?aab101=1">
      <input type="submit" name="next" value="�ҵĸ�����Ϣ" 
      formaction="<%=path%>/queryMessage.html?aab101=1">     
  
</form>
</body>
</html>