package com.neusoft.web.impl;
/**
 * �û��������˳�������ʳ��
 * @author ���ɺ
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
