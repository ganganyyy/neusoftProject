<!-- author:���ɺ -->
<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navigationBar.jsp" %>
<html>
<head>
        <title>JSP Page</title>
        <link rel="stylesheet" href="layui/css/layui.css" media="all">
        <link rel="stylesheet" href="define/css/stylegan.css" media="all">
</head>
    <body>
    
        <div class="layui-container" style="margin-top:90px;margin-left:20%; width:60%">
        <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  			<legend>��Ӹ��˲�����Ʒ</legend>
		</fieldset>
            <form class="layui-form" action="<%=path%>/uploadtest" enctype="multipart/form-data" method="post">
            <input hidden="true" id="aae101" name="aae101" value="${param.aae101 }"/>
                <input hidden="true" id="aab101" name="aab101" value="${sessionScope.aab101Self }"/>
                <div class="layui-form-item layui-form-text">
                    <label class="layui-form-label">��Ʒ����</label>
                    <div class="layui-input-block">
                        <textarea id="desc" name="desc" placeholder="����������" maxlength="1000" class="layui-textarea"></textarea>
                    </div>
                </div>
                
                
                <div class="layui-form-item">
                    <label class="layui-form-label">�ϴ��ļ�</label>
                    <div class="layui-input-inline uploadHeadImage">
                        <div class="layui-upload-drag" id="uploadFile">
                            <i class="layui-icon">�v</i>
                            <p>����ϴ��ļ������ļ���ק���˴���</p>
                        </div>
                    </div>
                    <div class="layui-input-inline">
                        <div id="uploadResult" class="layui-upload-list">
                            
                        </div>
                    </div>
                </div>

                
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn"  id="uploadBtn">�ύ</button>
                        <button type="reset" class="layui-btn layui-btn-primary">����</button>
                    </div>
                </div>
   
            </form>
        </div>
    </body>

    <script src="assets/js/jquery.min.js"></script>
    <script src="./layui/layui.js"></script>

     <script>
        layui.use('upload', function() {
            var upload = layui.upload;

            //ִ���ϴ�
            var uploadInst = upload.render({
                elem: '#uploadFile', //��Ԫ��
                url: '../FileUploadServlet', //�ϴ��ӿ�
                method: 'POST',
                auto: false,
                accept: 'file',
                bindAction: '#uploadBtn',
                size: 10240,//�����ļ���С10M
                multiple: false,
                data:{},
                
                before: function(obj) {
                    layer.load();
                    
                    this.data.title = $('#title').val();
                }, 
                
                done: function(data, index, upload) {//�ϴ���ϻص�
                    layer.closeAll('loading');

                    if (data.no === 1) {
                        layer.msg("�ϴ��ɹ���", {
                            icon: 6
                        });
                    } else {
                        layer.msg("�ϴ�ʧ�ܣ����Ժ����ԣ�", {
                            icon: 5
                        });
                    }
                    
                    var uuid = data.uuid;
                    
                    $("#uploadResult").append('<input readonly type="text" value="'+uuid+'" class="layui-input" />');
                }
                , error: function() {//�����쳣�ص�
                    layer.closeAll('loading');
                }
            });
        });
    </script>
</html>