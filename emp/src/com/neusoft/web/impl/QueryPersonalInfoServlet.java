package com.neusoft.web.impl;
/**
 * 搜索个人信息
 * @author 吴佳珊
 */
public class QueryPersonalInfoServlet extends PersonalControllerSupport
{

	@Override
	public String execute() throws Exception
	{
		this.getInstance("findByIdPhoto", "", "photo");
		return "personalInfo";
	}
	

}
