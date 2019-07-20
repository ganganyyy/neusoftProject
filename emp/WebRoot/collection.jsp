<!-- author:������ -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
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

<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/stylegan.css" media="all">
<link href="./define/css/styles.css" rel="stylesheet">
<script type="text/javascript" src="./define/js/move-top.js"></script>
<script type="text/javascript" src="./define/js/easing.js"></script>
<script src="./define/js/jquery.min.js"></script>

<script type="text/javascript">

function rfuzhi(aad301){
	document.getElementById("raad301").value=aad301;
};
function dfuzhi(aad301){
	document.getElementById("daad301").value=aad301;
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
	 vform.action="<%=path%>/delColl.html";
	 vform.submit();
}
function grename(aad301,i)
{
	 document.getElementById("raad301").value=aad301;
	 var gaad302="gaad302"+i;
	 var raad302=document.getElementById(gaad302).value;
	 document.getElementById("raad302").value=raad302;
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/rename.html";
	 vform.submit();
}
function gdel(aad301)
{
	 document.getElementById("daad301").value=aad301;
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/delColl.html";
	 vform.submit();
}
function create()
{
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/creColl.html";
	 vform.submit();
}
</script>

	</head>
	<body>

        <form id="myform" method="post">
        <div class="layui-container" style="margin-top:50px;margin-left:15%; width:70%">
        </div>
        <!--   Ϊͷ�����¿���       -->
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
                         <a href="<%=path%>/homeColl.html?aad301=${ins.aad301}">
                         <span class="img-box">
                             <img src="${ins.aad303}" width="280" height="173">
                         </span>
                         </a>
                     <div class="user">
                     <a href="<%=path%>/homeColl.html?aad301=${ins.aad301}"><strong>${ins.aad302}</strong></a>
                     <div class="fr manage">
                         <a href="javascript:;"><span class="icon-uedit"></span></a>
                         <ul class="manage-list">
                             <li><a href="javascript:void(0);" onclick="rfuzhi('${ins.aad301}')"><span class="icon-uedit"></span>������</a></li>
                             <li><a href="javascript:void(0);" onclick="dfuzhi('${ins.aad301}')"><span class="icon-del"></span>ɾ��</a></li>
                         </ul>
                     </div> 
                     </div>
                 </li>
        </c:forEach>
		</c:when>
		<c:otherwise>
		�����ղؼ�
		</c:otherwise>
		</c:choose>
        </ul>
		</div>
				        
        <!-- ɾ���ղؼе��� start -->
        <div class="popup-box popup-del" >
            <div class="popup">
                <div class="popup-tit">ɾ���ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                <input type="hidden" id="daad301" name="daad301">
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
        <div class="popup-box popup-rename" >
            <div class="popup">
                <div class="popup-tit">�������ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                    <div class="txt-box">
                        <input type="hidden" name="raad301" id="raad301">
                        <input class="txt" type="text" name="raad302" id="raad302">
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

        <!-- �����ղؼе��� start -->
        <div class="popup-box popup-collect">
            <div class="popup">
                <div class="popup-tit">�����ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                    <div class="txt-box">
                        <input class="txt" type="text"maxlength="15" placeholder="�½��ղؼУ����ܳ���15����"
                               style="width:260px" name="caad302">
                        <button class="btn" type="button" onclick="create()">����</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- �����ղؼе��� end -->

        <!--�����ղؼе��� start-->
        <div class="popup-box popup-manage">
            <div class="popup">
                <div class="popup-tit">�����ղؼ�</div>
                <span class="popup-close icon-close"></span>
                <div class="popup-ct">
                    <ul class="list" id="popup-manage-list">
					
		<c:choose>
			<c:when test="${rows.size() != 0}">
			<c:forEach items="${rows}" var="ins" varStatus="vs">
            <li>
            <div class="fr btn-box btn-box1"><a href="javascript:;" class="btn-edit">�޸�</a><a onclick="gdel('${ins.aad301}')">ɾ��</a></div>
            <div class="fr btn-box btn-box2"><a onclick="grename('${ins.aad301}','${vs.count }')">����</a><a href="javascript:;" class="btn-cancel">ȡ��</a></div>
            <input type="text" value="${ins.aad302}" id="gaad302${vs.count }"class="input" disabled>
            <span class="num-box"><span class="num"></span>/15</span>
            </li>
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
        <!--�����ղؼе��� end-->

        </div>
		</div>
		</form>
	</body>
</html>
