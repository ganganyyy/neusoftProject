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
        	<div class="jianjie">
        		<img src="img/userkitchen/cffd00b5681c11e68b73f960d60360bd.jpg" class="img"/>
        		<div class="fl">
        				<h2>һ���а��ĳ���</h2>
        			   <!-- <span><i class="icon1"></i>2016-3-23 ����</span><br />-->
        				<div class="guanzhuderen">
						<div class="x y">
							<span>��ע����</span><br><a href="#"><span>256</span></a>
						</div>
						<div class="x">
							<span>����ע</span><br><a href="#"><span>775</span></a>
						</div>
					</div>
        				
        		</div>
        		<div class="fr">
					<a href="#"><div class="guanzhu2">��ע</div></a>
        		</div>
        	</div>
        	
        	<div class="kh20"></div>
		</div>
		
		 <div class="conwidth survey">
        	<div class="navigation">
        		<span class="teshu bqcaipu"><a href="#">����</a></span>
        		<span class="bqzuopin"><a href="#">��Ʒ</a></span>
        		<span class="bqshoucang"><a href="#">�ղ�</a></span>
        		<span class="bqliuyanban"><a href="<%=path%>/myLikes.html">����</a></span>
        		<span class="bqcaidan"><a href="#">���Ʒ</a></span>
        	</div>

        	<div class="kh20"></div>
          <form id="myform" method="post">
        	<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>����</legend>
				</fieldset>	
			         <!-- ��ʾʵ�ʲ�ѯ�������� -->
				     <c:forEach items="${reci}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chacaipu('${ins.aac101}')">
		            				<img src="${ins.aac108}" alt="����ͼƬ" width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac102}</p>
		        			<div class="stars">		        			    
		        				<a href="#" onclick="shanchu('${ins.aad101}')">ɾ��</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>
			  
			<div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>��Ʒ</legend>
				</fieldset>	
			         <!-- ��ʾʵ�ʲ�ѯ�������� -->
				     <c:forEach items="${pro}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazuopin('${ins.aac201}')">
		            				<img src="${ins.aac204}" alt="��ƷͼƬ" width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac203}</p>
		        			<div class="stars">		        			    
		        				<a href="#" onclick="shanchu('${ins.aad101}')">ɾ��</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>  
			  
			   <div class="userprod clearfix">
        		<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
					<legend>ר��</legend>
				</fieldset>
					
			         <!-- ��ʾʵ�ʲ�ѯ�������� -->
				     <c:forEach items="${comp}" var="ins" varStatus="vs">
			    	   	 <div class="userproduction">
		            		<div class="cover">
		            			<a href="#" onclick="chazhuanlan('${ins.aac301}')">
		            				<img src="img/zl.jpg"  width="300px" height="240px"/>
		            			</a>
		            		</div>
		            		<p>&nbsp;&nbsp;${ins.aac302}</p>
		        			<div class="stars">
		        				<a href="#" onclick="shanchu('${ins.aad101}')">ɾ��</a>
		        			</div>
				         </div>
				      </c:forEach>
			  </div>             
          </form>
       </div>
		<script type="text/javascript">
	      function shanchu(vaad101)
	      {
	    	 var vform = document.getElementById("myform");
	    	 vform.action="<%=path%>/cancleLike.html?aad101="+vaad101;
	    	 vform.submit();
	      }
	   </script>
	</body>
</html>
