package com.neusoft.web.impl;
/**
 * 搜索所有系统消息
 * @author 吴佳珊
 */
public class QueryMessageServlet extends MessageControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		this.savePageData();
		return "message";
	}

}
