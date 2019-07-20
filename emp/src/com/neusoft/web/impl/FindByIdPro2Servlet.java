package com.neusoft.web.impl;

/**
 * 修改作品前的查询
 * @author 韩金利
 */
public class FindByIdPro2Servlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "modifyPro";
	}
}

