//author:������
package com.neusoft.web.impl;

public class UpdateDetailServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.getInstanceList("querySteps", "����", "rows1");//����
		this.getInstanceList("query", "����", "rows2");//����
		return "updateReci";
	}

}
