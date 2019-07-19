package com.neusoft.web.impl;

/**
 * 管理员添加活动(无作品活动,有作品活动)
 * @author 吴佳珊
 */
public class AddEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		boolean flag=this.updateForEvent("addEvent","添加活动","aae107");
		if(flag)
		{
		 return "addEventOption";
		}
		else
		{
		return "queryEvent";
		}
	}

}
