package com.neusoft.web.impl;

/**
 * ��Ʒ����
 * @author ������
 */
public class AddComProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.update("addComment", "�ϴ�", "�ϴ��ɹ�", "");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}
