package com.neusoft.web.impl;
/**
 * �û�ȡ����ע
 * @author ���ɺ
 */
public class DelByIdSubServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById","ȡ����ע");
		this.savePageDataForDelete();
		return "subscribeByMe";
	}

}
