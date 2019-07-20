//author:¶­ÊçæÂ
package com.neusoft.web.impl;

public class CreCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("createColl", "ÖØÃüÃû");
		this.savePageInstance();
		this.getInstanceList("queryCollections", "ÊÕ²Ø¼Ğ", "rows");
		return "collection";
	}

}
