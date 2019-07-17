/**
 * @author:gangan
 * 注册页面
 */
  var select;
layui.use(['form','layer'], function(){
  
  var verifyCode;

  var form = layui.form;
  var layer=layui.layer;
  var $ = layui.jquery;
  
  /*form.verify({
	
	  aab103: function(value, item){ //value：表单的值、item：表单的DOM对象
	    alert(select);
		if(select==2&&value==null)
	    {
	    	return '密码不能为空！';
	    }
	  }
	  
	  //我们既支持上述函数式的方式，也支持下述数组的形式
	  //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
	  
	  
	});     */
  
  
  form.on('submit(btnVerify)', function (data) {
	  $.ajax({
	   		url: "/emp/getVerify.do"
	       , data: data.field
	       , async:false
	       , type: "post"
	       , dataType: "json" 
	       , success: function (obj) {
	    	   if(obj.msg==null||obj==undefined||obj=="")
	    	   {
	    		   alert("success");
	    		   verifyCode=obj.ins.verifyCode;
	    		   alert(verifyCode);
	    	   }
	    	   else
	    	   {
	    		   layer.alert(obj.msg, {icon: 5});   
	    	   }
	    	   
	       }
	   	  , error:function(obj){
				
	   		  alert("fail!");  		  
	   		  layer.alert(obj.msg, {icon: 5});    	
	   		
			}
	}); 
	  return false;//阻止表单跳转
  });

  
  form.on('submit(btnSubmit)', function (data) {
	  $.ajax({
	   		url: "/emp/registe.do"
	       , data: data.field
	       , async:false
	       , type: "post"
	       , dataType: "json" 
	       , success: function (obj) {
	    	   if(obj.msg==null||obj==undefined||obj=="")
	    	   {
	    		   alert("success");
	    		  
	    		   alert(obj.aab101);
	    	   }
	    	   else
	    	   {
	    		   layer.alert(obj.msg, {icon: 5});   
	    	   }
	    	   
	       }
	   	  , error:function(obj){
				
	   		  alert("fail!");  		  
	   		  layer.alert(obj.msg, {icon: 5});    	
	   		
			}
	}); 
	  return false;//阻止表单跳转
  });
  //各种基于事件的操作，下面会有进一步介绍
  
  
});


function changeRequired(type)
{
	var valid=(type==1)?"":"required";
	//1:获取验证码；2：提交
	select=type;
	/*document.getElementsByName("aab103")[0].lay-verify=valid;
	document.getElementsByName("repeat")[0].lay-verify=valid;
	document.getElementsByName("inputCode")[0].lay-verify=valid;*/
	
}



