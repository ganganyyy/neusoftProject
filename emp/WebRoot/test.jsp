<%@ page language="java"   pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%String path=request.getContextPath();%>
<html>
<head>
<script src="js/jquery.min.js" type="text/javascript" charset="utf-8"></script>
<title>Insert title here</title>
</head>
<script>
$(document).ready(function(){
	alert("enter ready");
	exeLatestMenu();
	
	

});
function exeLatestMenu(){
	$.ajax({
		url:'<%=path%>'+'/LatestMenu.jsp',
		type:'post',
		data:{
			
		},
		dataType:'json',
		success:function(data){
			
			alert("LatestMenu success");
			
		},
		error:function(data){
			
			alert("fail");
		}
	});	
}
</script>
<body>
${rows }
</body>
</html>