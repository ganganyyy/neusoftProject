<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form id="myform" action="<%=path%>/registe.html" method="post" onsubmit="return check();">
手机号码:<input type="text" name="aab104" required value="${ins.aab104 }">
<br/>
密码:<input type="text" name="aab103" required>
<br/>
确认密码：<input type="text" name="repeat" required>
<br/> 
短信验证码：<input type="text" name="inputCode" required>
<input type="submit" name="getVerify" value="获取验证码"
        formaction="<%=path%>/getVerify.html" onclick="changeRequired('1');">
<input type="submit" name="next" value="提交" 
onclick="changeRequired('2');">

${ins.verifyCode }
<br/>
${msg }

<script type="text/javascript">
    var varifyCode="${ins.verifyCode}";
    var inputCode=document.getElementsByName("inputCode")[0];
	function check()
	{
		
		if(varifyCode==null)
		{
			alert("请先获取验证码！")
			return false;
		}
		else if(varifyCode==inputCode)
		{
			return true;
		}
		else if(1)
		{
			//确认密码和密码验证
			//
			return true;
		}
		else
		{
			alert("验证码错误！")
			return false;
		}	
	}
	
	function changeRequired(type)
	{
		var valid=(type==1)?false:true;
	
		document.getElementsByName("aab103")[0].required=valid;
		document.getElementsByName("repeat")[0].required=valid;
		document.getElementsByName("inputCode")[0].required=valid;
		if(valid==false)
		{
			 var vform = document.getElementById("myform");
			 vform.onsubmit=true;
		}
	}
	
	
</script>
</form>
</body>
</html>