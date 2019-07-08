<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%String path=request.getContextPath(); %>
<html>
<head>
	<title>��Ʒ��̬</title>
	<link href="layui/css/layui.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="css/main.css"/>
	<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
	
	 <script type="text/javascript">
      function onEdit(vaac201)
      {
    	 var vform = document.getElementById("myform");
    	 vform.action="<%=path%>/findByIdPro.html?aac201="+vaac201;
    	 vform.submit();
      }
   </script>
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

  <div class="conwidth">
  <div class="conwidth survey">
        	<div class="fubiaoti2 clearfix">
        		<h1 style="font-family:'Microsoft YaHei';font-size:34px ">���ղ��ף���������Ʒ</h1>
        	</div>
        	<div class="kh20"></div>
        	
	<div class="userprod clearfix">
		<form id="myform" method="post">	
	         <!-- ��ʾʵ�ʲ�ѯ�������� -->
		     <c:forEach items="${rows }" var="ins" varStatus="vs">
	    	   	 <div class="userproduction">
            		<div class="cover">
            			<a href="#" onclick="onEdit('${ins.aac201}')">
            				<img src="${ins.aac204}" alt="��ƷͼƬ" width="300"/>
            			</a>
            		</div>
        			<p>&nbsp;&nbsp;${ins.aac203}</p>
        			<div class="stars">
        				<span class="a">${ins.aac202}</span>
                    	<span class="b">${ins.aac101}</span>
                    	<span class="c">${ins.aac207}</span>
        			</div>
		         </div>
		      </c:forEach>
		 </form>
	  </div>
	</div>
  </div>
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
	<script src="js/main.js" type="text/javascript"></script>
	<script src="layui/layui.js"></script>

</body>
</html>