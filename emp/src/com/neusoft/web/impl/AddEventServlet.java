package com.neusoft.web.impl;

public class AddEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateForEvent("addEvent","��ӻ","aae107");
		if(flag)
		{
		 return "addEventOption";
		}
		else
		{
		return "addEvent";
		}
	}

}
