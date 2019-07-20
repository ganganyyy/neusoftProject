package com.neusoft.web.impl;
/**
 * 用户搜索个人厨房所有食谱
 * @author 吴佳珊
 */
public class QueryHomeRecipeServlet extends HomeRecipeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageData();
		return "queryHomeRecipe";
	}

}
