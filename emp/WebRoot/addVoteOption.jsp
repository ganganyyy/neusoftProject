<!-- author:吴佳珊 -->
<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="http://org.wangxg/jsp/extl"  prefix="e"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%String path=request.getContextPath();%>
<html>
<head>
<title>增加活动投稿</title>
    <script src="assets/js/echarts.min.js"></script>
    <link rel="stylesheet" href="assets/css/amazeui.min.css" />
    <link rel="stylesheet" href="assets/css/amazeui.datatables.min.css" />
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="css/main.css">
    <script src="assets/js/jquery.min.js"></script>
    <!--引入CSS-->
    <link rel="stylesheet" type="text/css" href="webuploader文件夹/webuploader.css">

    <!--引入JS-->
    <script type="text/javascript" src="webuploader文件夹/webuploader.js"></script>
</head>
<body>
${msg }
            <script src="assets/js/theme.js"></script>
            <form action="<%=path%>/uploadVoteOption.html" method="post">
            <div class="kh40"></div>
                    


                    <div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
                        
                        <div class="widget am-cf">
                            <div class="widget-head am-cf">
                                <div class="widget-title am-fl">上传活动内容</div>
                            </div>
                            
                            
                            <div class="widget-body am-fr">

                              <div id="uploader" class="wu-example">
                              <!--用来存放文件信息-->
                        <div id="thelist" class="uploader-list"></div>
                         <div class="btns">
                        <div id="picker">选择文件</div>
                       <button id="ctlBtn" class="btn btn-default">开始上传</button>
                       </div>
                        </div>
                              
                                   <!--  图片
                                   <div class="am-form-group">
                                        <label for="user-weibo" class="am-u-sm-3 am-form-label">封面图 </label>
                                          <div class="am-u-sm-9">
                                          <div class="rkh10">
                                             <input type="file" name="images">
                                             </div>

                                        </div>
                                        
                                        
                                    </div>

                                   -->
                                   
                                  
                                   


                                    <div class="am-form-group">
                                        <label for="user-intro"  class="am-u-sm-3 am-form-label">文章内容</label>
                                        <div class="am-u-sm-9">
                                           <e:textarea rows="20" cols="50" name="aae203" value=""/>
                                        </div>
                                    </div>
                                    

                                    <div class="am-form-group">
                                        <div class="am-u-sm-9 am-u-sm-push-3">
                                            <input type="submit" class="am-btn am-btn-primary tpl-btn-bg-color-success" value="提交"/>
                                            
                                        </div>
                                    </div>
                              
                            </div>
                           
                        </div>
                    </div>
               
               
                
	 </form>

</body>
</html>