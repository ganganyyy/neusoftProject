function onFind()
{
	 var aac101="20";
	 var vform = document.getElementById("myform");
	 vform.action="<%=path%>/details.html?aac101="+aac101;
	 vform.submit();
}
function give(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/likeReci.html?aac101="+vaac101; 
	vform.submit();
}
function cancle(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleLikeReci.html?aac101="+vaac101; 
	vform.submit();
}
function shoucang(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/shoucangReci.html?aac101="+vaac101; 
	vform.submit();
}
function cancleShoucang(vaac101) 
{
	var vform = document.getElementById("myform");
	vform.action="<%=path%>/cancleshoucangReci.html?aac101="+vaac101; 
	vform.submit();
}