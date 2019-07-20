//author:¶­ÊçæÂ
package com.neusoft.web.impl;

public class CollectServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.getInstanceList("queryCollections", "ÊÕ²Ø¼Ð", "rows");
		return "collection";
	}

}
