package com.neusoft.web.impl;
/**
 * 用户删除系统消息
 * @author 吴佳珊
 */
public class DelByIdMessageServlet extends MessageControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById", "删除消息");
		this.savePageDataForDelete();
		this.savePageInstance();
		return "message";
	}

}
