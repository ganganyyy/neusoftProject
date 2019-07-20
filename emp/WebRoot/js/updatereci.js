    function getaac601()
    {
    	var aac601 = document.getElementById("ings").getElementsByTagName("tr").length;
    	return aac601;
    }
    
    function getingsNum()
    {
    	var ingsNum = document.getElementById("ings").getElementsByTagName("tr").length;
    	document.getElementById("ingsNum").value=ingsNum;
    	var form = document.getElementById("myform");
    	form.submit();
    }
    
    function getaac404()
    {
    	var aac404 = document.getElementById("zuofa").getElementsByClassName("layui-row").length;
    	return aac404;
    }

    //菜谱图片
    function Image(imgFile) 
    {
     var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
     if(!pattern.test(imgFile.value)) 
     { 
      alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
      imgFile.focus(); 
     } 
     else 
     { 
      var path; 
      if(document.all)//IE 
      { 
       imgFile.select(); 
       path = document.selection.createRange().text; 
       document.getElementById("imgPreview").innerHTML=""; 
       document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
      } 
      else//FF 
      {
       path = URL.createObjectURL(imgFile.files[0]);
       document.getElementById("imgPreview").innerHTML = "<img src=' "+path+" ' width='600px' height='400px'/>";
      } 
     } 
    }
    
    //步骤图片
    function PreviewImage(imgFile,i) 
    {
     var pattern = /(\.*.jpg$)|(\.*.png$)|(\.*.jpeg$)|(\.*.gif$)|(\.*.bmp$)/;      
     if(!pattern.test(imgFile.value)) 
     { 
      alert("系统仅支持jpg/jpeg/png/gif/bmp格式的照片！");  
      imgFile.focus(); 
     } 
     else 
     { 
      var path; 
      if(document.all)//IE 
      { 
       imgFile.select(); 
       path = document.selection.createRange().text; 
       document.getElementById("imgPreview").innerHTML=""; 
       document.getElementById("imgPreview").style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enabled='true',sizingMethod='scale',src=\"" + path + "\")";//使用滤镜效果 
      } 
      else//FF 
      {
       path = URL.createObjectURL(imgFile.files[0]);
       document.getElementById("imgPreview"+ i).innerHTML = "<img src=' "+path+" ' width='350px' height='250px'/>";
      } 
     } 
    }