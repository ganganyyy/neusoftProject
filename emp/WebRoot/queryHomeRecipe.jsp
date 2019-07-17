<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
	<head>
		<meta charset="GBK">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
		<link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="css/test.css">
        <script type="text/javascript">
        function getWork(vaab101)
        {
      	 var vform = document.getElementById("myform");
      	 vform.action="<%=path%>/queryHomeWork.html?aab101=1";
      	 vform.submit();
        }
        </script>
	
	</head>
	<body>
	
	<form id="myform" action="<%=path%>/queryEvent.html" method="post">
   <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%;"> 
        <div class="konghang"></div>
        <c:if test="${ins!=null }">
        <div class="conwidth">
        
        
        	<div class="jianjie">
        		<img src="${ins.aab106 }" class="img"/>
        		<div class="fl">
        				<h2>${ins.aab102 }�ĳ���</h2>
        			   <!-- <span><i class="icon1"></i>2016-3-23 ����</span><br />-->
        				<div class="guanzhuderen">
						<div class="x y">
							<span>��ע����</span><br><a href="#"><span>${ins.aab107 }</span></a>
						</div>
						<div class="x">
							<span>����ע</span><br><a href="#"><span>${ins.aab108 }</span></a>
						</div>
					</div>
        				
        		</div>
        		<div class="fr">
					<a href="#"><div class="guanzhu2">��ע</div></a>
        		</div>
        	</div>
        	
        	<div class="kh20"></div>
		</div>
		</c:if>
		
		
		 <div class="conwidth survey">
        	<div class="navigation">
        		<span class="teshu bqcaipu"><a href="#">����</a></span>
        		<span class="bqzuopin"><a href="#" onclick="getWork('${ins.aab101}')">��Ʒ</a></span>
        		<span class="bqshoucang"><a href="#">�ղ�</a></span>
        		<span class="bqliuyanban"><a href="#">����</a></span>
        		<span class="bqcaidan"><a href="#">���Ʒ</a></span>
        	</div>
        
        	<div class="kh20"></div>
        	
        	<div class="layui-row layui-col-space25">

<c:if test="${rows!=null }">
<c:forEach items="${rows }" var="ins">

<div class="layui-col-md4 layui-col-sm6">
<div class="layadmin-contact-box">
<div class="layui-col-md12">
<div class="layadmin-text-center">
      <img src="${ins.aac108 }" style="border-radius:0px;margin-bottom:15px;">
</div>
</div>
<div class="layui-col-md12">
          <a href="javascript:;">
            <h3 style="color:#d3c5a1;text-align:center;">
              <strong>${ins.aac102 }</strong>
            </h3>
          </a>
</div>
</div>
</div>

</c:forEach>
</c:if>


</div> 
            
       </div>
      
		</div>
		
		</form>
	</body>
</html>
