package com.neusoft.web.impl;
/**
 * 申请升级,500分以上自动升级,未达500分则提交到审核表中
 * @author 吴佳珊
 */
public class UpgradeServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getInstance("findByIdPhoto", "", "photo");
		if(this.updateNoMsg("countSum"))
		{
		this.update("upgrade", "用户升级");
		}
		else
		{
			this.update("applyUpdate", "总分未达500分,提交升级申请");
		}
		return "upgrade";
	}

}
