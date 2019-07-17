/**
 * @author:gangan
 * 登录页面的跳转
 */

layui.use(['form','layer'], function(){
  var form = layui.form;
  var layer=layui.layer;
  var $ = layui.jquery;
  
  form.on('submit(*)', function (data) {
	  $.ajax({
	   		url: "/emp/login.do"
	       , data: data.field
	       , async:false
	       , type: "post"
	       , dataType: "json" 
	       , success: function (obj) {
	           if(obj.msg==undefined||obj.msg==null||obj.msg=="")
	           {
	         	  /**
	         	   * 登录成功
	         	   */
	        	   window.location.href="mainPage.jsp";

	           }
	           else
	           { 
	        	   layer.alert(obj.msg, {icon: 5});    	
	           } 
	       }
	   	  , error:function(obj){
				
	   		  alert("fail");
	   		window.location.href="Error.jsp";
			}
	}); 
	  return false;//阻止表单跳转
  });

  //各种基于事件的操作，下面会有进一步介绍
});




