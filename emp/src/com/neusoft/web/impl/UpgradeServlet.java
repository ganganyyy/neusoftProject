package com.neusoft.web.impl;

public class UpgradeServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		if(this.updateNoMsg("countSum"))
		{
		this.update("upgrade", "�û�����");
		}
		else
		{
			this.update("applyUpdate", "�ܷ�δ��500��,�ύ��������");
		}
		return "message";
	}

}
