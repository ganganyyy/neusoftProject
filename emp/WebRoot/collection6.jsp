<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
	<head>
		<meta charset="GBK">
		<title>�ղؼ�</title>
		<link rel="stylesheet" type="text/css" href="css/main.css"/>
		<link rel="stylesheet" type="text/css" href="css/user_kitchen.css"/>
		<link rel="stylesheet" href="layui/css/layui.css"  media="all">
        <link rel="stylesheet" href="css/test.css">
        <link rel="stylesheet" href="css/collection/common.css">
        <link rel="stylesheet" href="css/collection/page.css">
        <link rel="stylesheet" href="css/collection/user.css">

        <script src="js/collection/jquery-1.9.1.min.js" type="text/javascript" charset="GBK"></script>
        <script src="js/collection/common.js" type="text/javascript" charset="GBK"></script>
        <script src="js/collection/user.js" type="text/javascript" charset="GBK"></script>

<script type="text/javascript">

function fuzhi(aad301){
	document.getElementById("aad301").value=aad301;
};
//����
function ShowDiv(show_div,aad301){
	document.getElementById("aad301").value=aad301;
	document.getElementById(show_div).style.display='block';
	document.getElementById(show_div).style.top = window.scrollY + 'px';
};
//�ջ�
function CloseDiv(show_div)
{
	document.getElementById(show_div).style.display='none';
};
function rename()
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/rename.html";
	 vform.submit();
}
function del()
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/delcoll.html";
	 vform.submit();
}
</script>

	</head>
	<body>

        <form id="myform" method="post">
        <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%">
        <!--   Ϊͷ�����¿���       -->
        <div class="konghang"></div>
        <div class="conwidth">
        <div class="kh20"></div>
		</div>
		
		 <div class="conwidth survey">
		 
        	<div class="navigation">
        		<span class="teshu bqcaipu"><a href="#">����</a></span>
        		<span class="bqzuopin"><a href="#">��Ʒ</a></span>
        		<span class="bqshoucang"><a href="<%=path%>/collect.html">�ղ�</a></span>
        		<span class="bqliuyanban"><a href="#">����</a></span>
        		<span class="bqcaidan"><a href="#">���Ʒ</a></span>
        	</div>
            
        <div class="wrap user-box">
            <div class="myworks-tab follow-tab">
                <a class="btn-collect" href="javascript:;">�����ղؼ�</a>
                <a class="btn-manage" href="javascript:;">����</a>
            </div>

            <div class="zsj-box">
            <ul class="list-collect">
	
		    <c:choose>
			<c:when test="${rows.size() != 0}">
			<c:forEach items="${rows}" var="ins" varStatus="vs">
                 <li>
                         <a href="�ղؼ�-չ��.html">
                         <span class="img-box">
                             <img src="${ins.aad303}" width="280" height="173">
                         </span>
                     </a>
                     <div class="user">
                     <a href="�ղؼ�-չ��.html"><strong>${ins.aad302}</strong></a>
                     <div class="fr manage">
                         <a href="javascript:;"><span class="icon-uedit"></span></a>
                         <ul class="manage-list">
                             <li><a href="javascript:;"><span class="icon-uedit"></span>������</a></li>
                             <li><a href="javascript:;"><span class="icon-del"></span>ɾ��</a></li>
                         </ul>
                     </div> 
                     </div>
                 </li>
				        
        <!-- ɾ���ղؼе��� start -->
        <div class="popup-box" id="del">
            <div class="popup">
                <div class="popup-tit">ɾ���ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                <input type="hidden" id="aad301" name="aad301">
                                ɾ�����ղؼ�,�ղ�����Ҳ��ͬ���Ƴ�<br>ȷ��Ҫɾ����?
                </div>
                <div class="popup-btn-box">
                    <a onclick="del()" class="btn btn-blue">ȷ��</a>
                    <a href="javascript:;" class="btn btn-gray">ȡ��</a>
                </div>
            </div>
        </div>
        <!-- ɾ���ղؼе��� end -->
        
        <!-- �������ղؼе��� start -->
        <div class="popup-box" >
            <div class="popup">
                <div class="popup-tit">�������ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                    <div class="txt-box">
                        <input type="hidden" value="${ins.aad301}" name="aad301">
                        <input class="txt" type="text" name="aad302">
                        <span class="num-box"><span class="num"></span>/15</span>
                    </div>
                </div>
                <div class="popup-btn-box">
                    <a onclick="rename()" class="btn btn-blue">����</a>
                    <a href="javascript:;" class="btn btn-gray">ȡ��</a>
                </div>
            </div>
        </div>
        <!-- �������ղؼе��� end -->
        
        </c:forEach>
		</c:when>
		<c:otherwise>
		�����ղؼ�
		</c:otherwise>
		</c:choose>
        </ul>
		</div>
       </div>
		</div>
		</form>
	</body>
</html>
