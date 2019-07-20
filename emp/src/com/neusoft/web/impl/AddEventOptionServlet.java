package com.neusoft.web.impl;
/**
 * 添加活动选项
 * @author 吴佳珊
 */
public class AddEventOptionServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("addEventOption", "添加活动选项");
		return "queryEvent";
	}

}
