//author:������
package com.neusoft.web.impl;

public class CreCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("createColl", "������");
		this.savePageInstance();
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		return "collection";
	}

}
