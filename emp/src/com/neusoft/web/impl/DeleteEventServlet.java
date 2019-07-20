package com.neusoft.web.impl;
/**
 * 管理员删除活动
 * @author 吴佳珊
 */
public class DeleteEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("deleteById", "删除");
		return "eventManager";
	}

}
