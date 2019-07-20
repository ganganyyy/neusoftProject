<!-- author:���ɺ -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
	<head>
		<meta charset="GBK">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
		<link rel="stylesheet" href="layui/css/layui.css"  media="all">
		<link rel="stylesheet" href="define/css/stylegan.css" media="all">
        <link rel="stylesheet" href="css/test.css">
        <script type="text/javascript">
        function getRecipe(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/queryHomeRecipe.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getWork(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/queryHomeWork.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getCol(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/collect.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getLike(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/myLikes.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getSub(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/queryAllSubscribe.html?aab101="+vaab101;
        	 vform.submit();
        }
        function getSubByMe(vaab101)
        {
        	 var vform = document.getElementById("myform");
        	 vform.action="<%=path%>/querySubMe.html?aab101="+vaab101;
        	 vform.submit();
        }
        function chazuopin(vaac201)
	      {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/findByIdPro.html?aac201="+vaac201;
	    	 vform.submit();
	      }
        </script>
	</head>
	<body>
	<form id="myform" action="<%=path%>/queryEvent.html" method="post">
           <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%">
        <!--   Ϊͷ�����¿���       -->
        <c:if test="${ins!=null }">
       <div class="conwidth">
        
        
        	<div class="jianjie">
        		<img src="${ins.aab106 }" class="img"/>
        		<div class="fl">
        				<h2>${ins.aab102 }�ĳ���</h2>
        			   <!-- <span><i class="icon1"></i>2016-3-23 ����</span><br />-->
        				<div class="guanzhuderen">
						<div class="x y">
							<span>��ע����</span><br><a href="#" onclick="getSub('${param.aab101}');"><span>${ins.aab107 }</span></a>
						</div>
						<div class="x">
							<span>����ע</span><br><a href="#" onclick="getSubByMe('${param.aab101}');"><span>${ins.aab108 }</span></a>
						</div>
					</div>
        				
        		</div>
        		
        		
        	</div>
        	
        	<div class="kh20"></div>
		</div>
		</c:if>
		
		 <div class="conwidth survey">
        	<div class="navigation">
        		<span class="bqcaipu"><a href="#" onclick="getRecipe('${param.aab101}')">����</a></span>
        		<span class="teshu bqzuopin"><a href="#" onclick="getWork('${param.aab101}')">��Ʒ</a></span>
        		<span class="bqshoucang"><a href="#" onclick="getCol('${param.aab101}')">�ղ�</a></span>
        		<span class="bqliuyanban"><a href="#" onclick="getLike('${param.aab101}')">����</a></span>
        	</div>

        	<div class="kh20"></div>
        	
        	<div class="layui-row layui-col-space25">

<c:if test="${rows!=null }">
<c:forEach items="${rows }" var="ins">

<div class="layui-col-md4 layui-col-sm6">
<div class="layadmin-contact-box">
<div class="layui-col-md12">
<div class="layadmin-text-center">
      <img src="${ins.aac204 }" onclick="chazuopin('${ins.aac201}')" style="border-radius:0%;margin-bottom:15px;">
</div>
</div>
<div class="layui-col-md12">
          <a href="#" onclick="chazuopin('${ins.aac201}')">
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
