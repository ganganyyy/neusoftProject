package com.neusoft.web.impl;
/**
 * ���¸�����Ϣ
 * @author ���ɺ
 */
public class UpdateInfoServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateNoMsg("checkPassword");
		this.updateForInfo("updateInfo", "�޸ĸ�����Ϣ",flag);
		this.getInstance("findByIdPhoto", "", "photo");
		return "personalInfo";
		
	}

}
