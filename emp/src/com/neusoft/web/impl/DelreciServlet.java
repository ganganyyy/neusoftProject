//author:¶­ÊçæÂ
package com.neusoft.web.impl;

public class DelreciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "É¾³ý");
		return "mainPage";
	}

}
