<!-- author:��ʫ��    ע����� -->
<%@ page language="java" pageEncoding="GBK"%>
<%String path=request.getContextPath();%>
<html>
<head>
<title>ע��ҳ��</title>
<link rel="stylesheet" href="./layui/css/layui.css" media="all">
<link rel="stylesheet" href="./define/css/style.css">
</head>
<body class="layui-bg-gray">
<div class="layui-container"  style="width:520px;margin-top:100px;" >
<fieldset class="layui-elem-field layui-field-title" style="width:550px">
  <legend align="center">ע��</legend>
  <div class="layui-field-box" align="center" style="font-size: 12px;color:#c2c2c2">

	С�ܽ�������
	�ٺٺ�С���Ʒ
  </div>
</fieldset>
</br>

<form class="layui-form"> <!-- ��ʾ������㲻����form������Ի���div���κ�һ����ͨԪ�� -->
  <div class="layui-form-item">
    <label class="layui-form-label"><i class="layui-icon layui-icon-username"></i></label>
    <div class="layui-input-block">
      <input type="text" name="aab104" placeholder="�������ֻ�����" autocomplete="off" class="layui-input" lay-verify="phone|required">	  
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
    <div class="layui-input-block">
      <input type="text" name="aab103" placeholder="����������" autocomplete="off" class="layui-input" lay-verify="aab103">	  
    </div>
  </div>
  <div class="layui-form-item">
    <label class="layui-form-label"><i class="layui-icon layui-icon-password"></i></label>
    <div class="layui-input-block">
      <input type="text" name="repeat" placeholder="������ȷ������" autocomplete="off" class="layui-input" lay-verify="required">	  
    </div>
  </div>
  
   <div class="layui-form-item">
   <label class="layui-form-label"><i class="layui-icon layui-icon-vercode"></i></label>
    <div class="layui-inline" >
      <input type="text" name="inputCode" placeholder="��������֤��" autocomplete="off" class="layui-input"  lay-verify="inputCode"
	  style="width:235px">
    </div>
	<div class="layui-inline" style="position: absolute;margin-left: 10px;">
	  <button class="layui-btn" lay-submit lay-filter="btnVerify" style="width:125px" name="getVerify" onclick="changeRequired('1');" >��ȡ������֤��</button>
	</div>
  </div>
  
 
  <div class="layui-input-item">
    <div class="layui-input-block layui-row">
		<div class="layui-col-md6">
			<button class="layui-btn" lay-submit lay-filter="btnSubmit" style="width:100%" name="next" onclick="changeRequired('2');">�����ύ</button>
		</div>
		<div class="layui-col-md5 layui-col-md-offset1">
			<button type="reset" class="layui-btn layui-btn-primary" style="width:100%"  >����</button>
		</div>
    </div>
  </div>
   
  <fieldset class="layui-elem-field layui-field-title" style="width:550px">
    <legend align="center"></legend>
    <div class="layui-field-box layui-row" style="font-size: 12px;margin-left: 110px;">
  
	<div class="layui-col-md6">
  	�����˻���<a href="login.jsp">������¼</a>
    </div>
	<div class="layui-col-md6">
	<a onclick="" style="float:right;margin-right: 50px;">�������룿</a>
	</div>
  </fieldset>
  
 
  <!-- ������ṹ�Ű����Ʋ��ĵ���ࡾҳ��Ԫ��-����һ������ -->
</form>
</div>
<script src="./layui/layui.js"></script>
<script src="js/registe.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>