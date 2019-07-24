package com.neusoft.web.impl;

/**
 * 删除作品
 * @author 韩金利
 */
public class DelByIdProServlet extends ProControllerSupport
{
	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "删除");
		this.getInstanceList("myPro", "", "rows");
		this.getInstance("me", "", "ins");
		return "queryHomeWork";
	}
}
