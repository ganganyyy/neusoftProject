package com.neusoft.web.impl;

public class UpdateInfoServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateNoMsg("checkPassword");
		this.updateForInfo("updateInfo", "�޸ĸ�����Ϣ",flag);
		return "personalInfo";
		
	}

}
