package com.neusoft.web.impl;
/**
 * ��������,500�������Զ�����,δ��500�����ύ����˱���
 * @author ���ɺ
 */
public class UpgradeServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.getInstance("findByIdPhoto", "", "photo");
		if(this.updateNoMsg("countSum"))
		{
		this.update("upgrade", "�û�����");
		}
		else
		{
			this.update("applyUpdate", "�ܷ�δ��500��,�ύ��������");
		}
		return "upgrade";
	}

}
