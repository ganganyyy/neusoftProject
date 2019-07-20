/**
 * @author:刘诗滢 吴佳珊
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

/**
 * 跳转到我的厨房
 * @param vaab101
 * @returns
 */
function kitchen(vaab101)
{
	var vform = document.getElementById("myform");
	alert("/emp/queryHomeRecipe.html?aab101="+vaab101);
 	vform.action="/emp/queryHomeRecipe.html?aab101="+vaab101;
 	vform.submit();
}