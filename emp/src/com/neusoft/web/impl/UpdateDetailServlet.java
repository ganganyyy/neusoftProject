//author:董淑媛
package com.neusoft.web.impl;

public class UpdateDetailServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.getInstanceList("querySteps", "步骤", "rows1");//步骤
		this.getInstanceList("query", "用料", "rows2");//用料
		return "updateReci";
	}

}
