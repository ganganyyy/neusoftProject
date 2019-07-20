/**
 * @author:刘诗滢 吴佳珊
 */

/**
 * 跳转到个人中心
 * @param vaab101
 * @returns
 */
function personal(vaab101)
{
	var vform = document.getElementById("myform");
 	vform.action="/emp/queryMessage.html?aab101="+vaab101;
 	vform.submit();
}

/**
 * 跳转到食谱具体界面
 * @param type
 * @returns
 */
function toMenuDetail(aac101)
{

	var form=document.getElementById("myform");
	//alert("/emp/details.html?aac101="+aac101);
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
	//alert("/emp/queryHomeRecipe.html?aab101="+vaab101);
 	vform.action="/emp/queryHomeRecipe.html?aab101="+vaab101;
 	vform.submit();
}


/**
 * 跳转到食谱一览
 * @param type
 * @returns
 */
function selectType(type)
{
	//changeClass("option2");
	var form=document.getElementById("myform");
	form.action="/emp/allMenu.html?aac107="+type;
	form.submit();
	
}

/**
 * 改变toggle选中状态
 * @param id
 * @returns
 */
function changeClass(id)
{
	alert(id);
	for(var i=1;i<=5;i++)
	{
		var option="option"+i;
		alert(option);
		document.getElementById(option).class="";
	}
	document.getElementById(id).class="active";
	
	alert(document.getElementById(id).class);
}

/**
 * 跳转到所有活动页面
 * @param vaab101
 * @returns
 */
function ActiDetail(vaae101)
{
	var vform = document.getElementById("myform");
	//alert("/emp/queryVoteDetail.html?aae101="+vaae101);
 	vform.action="/emp/queryVoteDetail.html?aae101="+vaae101;
 	vform.submit();
}

