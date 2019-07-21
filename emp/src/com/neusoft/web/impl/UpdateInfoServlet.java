package com.neusoft.web.impl;
/**
 * 更新个人信息
 * @author 吴佳珊
 */
public class UpdateInfoServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateNoMsg("checkPassword");
		this.updateForInfo("updateInfo", "修改个人信息",flag);
		this.getInstance("findByIdPhoto", "", "photo");
		return "personalInfo";
		
	}

}
