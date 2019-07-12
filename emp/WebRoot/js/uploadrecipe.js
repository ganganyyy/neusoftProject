function addings()
    {
    	var a=getaac601()+1;
        var tableobj =document.getElementById("ings");
        var trobj =document.createElement("tr");
        var tdobj1 = document.createElement("td");
        tdobj1.innerHTML="<input type='text' style='width:100%; height:35px;border:0px;' name='"+a+"aac603'>";
        trobj.appendChild(tdobj1);
        var tdobj2 = document.createElement("td");
        tdobj2.innerHTML="<input type='text' style='width:100%; height:35px;border:0px;' name='"+a+"aac602'>";
        trobj.appendChild(tdobj2);
        var tdobj3 = document.createElement("td");
        tdobj3.innerHTML="<a class='layui-btn layui-btn-danger' onclick='delecttr(this)'>删除</a>";
        trobj.appendChild(tdobj3);
        tableobj.appendChild(trobj);
    }
    
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

    function addzuofa()
    {
    	var b=getaac404()+1;
        var obj =document.getElementById("zuofa");

        for(var i=1;i<2;i++)
        	{
            var rowobj = document.createElement("div");
            rowobj.className = "layui-row";
        	}
    	rowobj.innerHTML="<div class='kh30'></div>"
    	+"<div class='layui-col-md1'>"+b+"</div>"
    	+"<input type='hidden' name='"+b+"aac404' value='"+b+"'>"
        +"<div class='layui-col-md3'><textarea rows='5' cols='20' placeholder='添加菜谱描述' style='width:100%;border:0px;height:240px' name='"+b+"aac402'></textarea></div>"
        +"<div class='layui-col-md5'>"
        +"<input type='file' onchange='PreviewImage(this, "+b+")' name='images'/>"
        +"<div class='layui-upload'>"
        +"<button type='button' class='layui-btn' name='aac108'>上传图片</button>"
        +"<div class='layui-upload-list' id='imgPreview"+b+"'>"
        +"<img class='layui-upload-img' width='350px' height='250px'>"
        +"</div>"
        +"</div>"
        +"</div>"
        +"<div class='layui-col-md2'><br><br><br><br><br>&nbsp;&nbsp;<a class='layui-btn layui-btn-danger' onclick='delecttr(this)'>删除</a></div>";
        obj.appendChild(rowobj);
    }
    
    function delecttr(obj)
        {
        var tr = obj.parentNode.parentNode;
        tr.parentNode.removeChild(tr);
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