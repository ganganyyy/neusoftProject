/**
 * @author:刘诗滢
 */


/**
 * 跳转到食谱具体界面
 * @param type
 * @returns
 */
function toMenuDetail(aac101)
{

	var form=document.getElementById("myform");
	alert("/emp/details.html?aac101="+aac101);
	form.action="/emp/details.html?aac101="+aac101;
	form.submit();
	
}