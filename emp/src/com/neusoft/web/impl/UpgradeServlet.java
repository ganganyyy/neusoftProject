package com.neusoft.web.impl;

public class UpgradeServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		if(this.updateNoMsg("countSum"))
		{
		this.update("upgrade", "用户升级");
		}
		else
		{
			this.update("applyUpdate", "总分未达500分,提交升级申请");
		}
		return "message";
	}

}
