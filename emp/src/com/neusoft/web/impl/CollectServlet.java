//author:������
package com.neusoft.web.impl;

public class CollectServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		return "collection";
	}

}
