package com.neusoft.web.impl;

public class AddEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateForEvent("addEvent","Ìí¼Ó»î¶¯","aae107");
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
