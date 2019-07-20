package com.neusoft.web.impl;
/**
 * 用户取消关注
 * @author 吴佳珊
 */
public class DelByIdSubServlet extends SubscribeControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteById","取消关注");
		this.savePageDataForDelete();
		return "subscribeByMe";
	}

}
