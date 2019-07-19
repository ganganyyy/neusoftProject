package com.neusoft.web.impl;
/**
 * 管理员删除活动
 * @author 吴佳珊
 */
public class DelByIdEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception
	{
		this.update("deleteById", "删除");
		this.savePageDataForDelete();
		return "queryEvent";
	}

}
