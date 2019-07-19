package com.neusoft.web.impl;
/**
 * 用户批量删除系统消息
 * @author 吴佳珊
 */
public class DelMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("batchDelete", "批量删除");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}
