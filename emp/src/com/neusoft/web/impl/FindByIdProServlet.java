package com.neusoft.web.impl;

/**
 * ��ѯ��Ʒ����
 * @author ������
 */
public class FindByIdProServlet extends ProControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.getInstanceList("queryComment", "", "comments");
		this.getInstanceList("queryLikes", "", "likes");
		this.getInstanceList("queryCollections", "", "Collections");
		return "product";
	}
}
