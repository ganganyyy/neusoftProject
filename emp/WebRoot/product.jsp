<%@ page language="java" pageEncoding="GBK" %>
<%String path=request.getContextPath(); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<meta charset="UTF-8">
	<title>��Ʒ</title>
	<link rel="stylesheet" type="text/css" href="css/main.css">
	<link rel="stylesheet" type="text/css" href="css/product.css"/>
	<link rel="stylesheet" type="text/css" href="layui/css/layui.css">
</head>

<body>
	<div class="header">
	<div class="conwidth">
		<h1 class="fl"><a href="">��<span>ʰ</span></a></h1>
		<div class="search fl" id="search-box">
			<form action="#" method="get" target="_blank" >
				<input type="text" placeholder="�������ס�ʳ��"
					id="sreach-input" class="search-text fl"/>
				<input type="button" value="�Ѳ���" class="search-btn fl"/>
			</form>
		</div>
		<div class="nav fr">
		<ul>
                  <li><a href="">��ҳ</a></li>
                  <li class="menu-class"><a href="">���׷���</a>
                      <div class="topbar-menu">
                          <ul class="plain">
                          <li class='topbar-menu-head'>��������</li>
                          <li><a href="menu_class.html" >�ҳ���</a></li>
                          <li><a href="menu_class.html" >���ֲ�</a></li>
                          <li><a href="menu_class.html" >�·���</a></li>
                          <li><a href="menu_class.html" >���</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >�決</a></li>
                          <li><a href="menu_class.html" >С��</a></li>
                          </ul>
                          <ul class="plain">
                          <li class='topbar-menu-head'>����ʳ��</li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >ţ��</a></li>
                          <li><a href="menu_class.html" >��</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          </ul>
                          <ul class="plain">
                          <li class='topbar-menu-head'>ʱ��ʳ��</li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >��</a></li>
                          <li><a href="menu_class.html" >�㶹</a></li>
                          <li><a href="menu_class.html" >��ݮ</a></li>
                          <li><a href="menu_class.html" >���</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >����</a></li>
                          <li><a href="menu_class.html" >�²�</a></li>
                          </ul>
                          <div class="span">
                          <span><a href="">�鿴ȫ������</a></span>
                          </div>
                      </div>
                  </li>
                  <li><a href="">�˵�</a></li>
                 <li><a href="<%=path%>/queryPro.html">��Ʒ��̬</a></li>
               
             </ul>
		<div class="dengluzhuce fr">
			<a href="login.html">��¼</a>
			<a href="register .html">ע��</a>
		</div>
		</div>
	</div>
	         <div class="suggest" id="sreach-suggest"><!---����������ʾsuggest-->
	             <ul>
	                 <li>��"  "����û�</li>
	                 <li>��"  "��ز˵�</li>
	             </ul>
	         </div>
	     </div>
	<div class="konghang"></div>

	<form id="myform" action="<%=path%>/queryPro.html" method="post">
		<div class="conwidth content clearfix">
			<div class="leftcon">
				<div class="ctitle">
					<span>${ins.aac102}&nbsp;����Ʒ</span>
				</div>
				<img src="${ins.aac204}"/>
				<div>
					<div class="author">				
						<img src="${ins.aab106}" width="100px"/>
						<span>${ins.aab102}</span>
						<span style="color:#DD3915">����</span>
						<span>${ins.aac102}</span>
					</div>
					<div class="fr">
					  <c:choose>
	     				<c:when test="${ins.aad201!=null}">
	     				    <a class="quxiaocang" id="canclezan" onclick="cancleColl('${ins.aac201}')" href="#">���ղ�</a>							
						</c:when>
					    <c:otherwise>
					    	<a class="shoucang" id="zan" onclick="giveColl('${ins.aac201}')" href="#" >�ղ�</a>
					    </c:otherwise>
					  </c:choose>
					  <c:choose>
	     				<c:when test="${ins.aad101!=null}">
	     				    <a class="quxiaozan" id="canclezan" onclick="cancleLike('${ins.aac201}')" href="#">����	</a>						
						</c:when>
					    <c:otherwise>
					    	<a class="dianzan" id="zan" onclick="giveLike('${ins.aac201}')" href="#" >��</a>
					    </c:otherwise>
					  </c:choose>						
					</div>
				</div>				
				<div class="desc">
					<p>${ins.aac203}</p><br/>
				</div>
				<div class="content-title">
					<p>����</p>
					<div class="content">
						<div class="info">
					    	<img src="img/san.jpg" width="45" height="45">					        
					        <a href="" class="info1">�����û�</a>
					        <span class="info2">        
					                                    ���� | &nbsp;45����ǰ |
					             <a href=""  class="huifu">�ظ�</a>
					        </span>				        
					    </div>
					    <div class="neirong">
					         	����̫����
					    </div>
					</div>
			    </div>								
		    </div>	    
		 </div>
	</form>
 	<div class="conwidth footer"><!----------------ҳ��---------------->
        <ul>
            <li><a href="#">��ʳ������־</a></li>
            <li><a href="#">��������</a></li>
            <li><a href="#">����ָ��ԭ��</a></li>
            <li><a href="#">��ʰ�������</a></li>
            <li><a href="#">��������</a></li>
            <li><a href="#">��ϵ����</a></li>
            <li><a href="#">�������</a></li>
            <li><a href="#">��˽����</a></li>
        </ul><br />
    </div>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/main.js"></script>
        <script src="layui/layui.js"></script>
        <script type="text/javascript">
        	function giveLike(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/likePro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function cancleLike(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/cancleLikePro.html?aac201="+vaac201; 
        		vform.submit();
        	}
        	function giveColl(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/collectionPro.html?aac201="+vaac201; 
        		vform.submit();
        	}
           	function cancleColl(vaac201) {
        		var vform = document.getElementById("myform");
        		vform.action="<%=path%>/cancleColl.html?aac201="+vaac201; 
        		vform.submit();
        	}
        </script>
</body>
</html>
