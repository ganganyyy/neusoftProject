<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
<form id="myform" action="<%=path%>/registe.html" method="post" onsubmit="return check();">
�ֻ�����:<input type="text" name="aab104" required value="${ins.aab104 }">
<br/>
����:<input type="text" name="aab103" required>
<br/>
ȷ�����룺<input type="text" name="repeat" required>
<br/> 
������֤�룺<input type="text" name="inputCode" required>
<input type="submit" name="getVerify" value="��ȡ��֤��"
        formaction="<%=path%>/getVerify.html" onclick="changeRequired('1');">
<input type="submit" name="next" value="�ύ" 
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
			alert("���Ȼ�ȡ��֤�룡")
			return false;
		}
		else if(varifyCode==inputCode)
		{
			return true;
		}
		else if(1)
		{
			//ȷ�������������֤
			//
			return true;
		}
		else
		{
			alert("��֤�����")
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