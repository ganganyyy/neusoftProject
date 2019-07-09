<%@ page language="java" pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String path=request.getContextPath();%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="<%=path%>/login.html" method="post">
ÊÖ»úºÅÂë£º<input type="text" name="aab104" required>
ÃÜÂë£º<input type="text" name="aab103" required>
<input type="submit" name="next">Ìá½»
${msg }
<br/>
${aab101 }
<br/>
${aab105 }
</form>
</body>
</html>