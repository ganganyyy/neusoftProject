//author:������
package com.neusoft.web.impl;

public class DelreciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "ɾ��");
		return "mainPage";
	}

}
