package com.neusoft.web.impl;
/**
 * ����������Ϣ
 * @author ���ɺ
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
