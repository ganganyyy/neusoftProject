package com.neusoft.web.impl;
/**
 * �û�ɾ��ϵͳ��Ϣ
 * @author ���ɺ
 */
public class DelByIdMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ����Ϣ");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}
