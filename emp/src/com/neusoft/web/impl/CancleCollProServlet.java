package com.neusoft.web.impl;

/**
 * ȡ����Ʒ�ղ�
 * @author ������
 */
public class CancleCollProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception
	{
		this.update("cancleCollection", "ȡ���ղ�");
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}
