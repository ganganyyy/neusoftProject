package com.neusoft.web.impl;
/**
 * 管理员搜索所有活动
 * @author 吴佳珊
 */
public class QueryEventServlet extends EventControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageData();
		return "queryEvent";
	}

}
