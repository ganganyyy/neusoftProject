package com.neusoft.web.impl;
/**
 * �û�����ɾ��ϵͳ��Ϣ
 * @author ���ɺ
 */
public class DelMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "����ɾ��");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}
