package com.neusoft.web.impl;
/**
 * ��ע
 * @author ���ɺ
 *
 */
public class AddSubscribeServlet extends SubscribeControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addSub", "��ע�ɹ�");
		return "queryHomeRecipe";
	}

}
