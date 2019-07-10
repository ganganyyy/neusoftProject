<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<%String ctxPath=request.getContextPath(); %>

<title>Insert title here</title>
</head>
<body>
	<form action="<%=ctxPath%>/upload" method="post"
		enctype="multipart/form-data">
		<input type="file" name="images">
		<button type="submit" name="upload">上传</button>
	</form>
</body>
</html>