package com.neusoft.web.impl;
/**
 * 关注
 * @author 吴佳珊
 *
 */
public class AddSubscribeServlet extends SubscribeControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addSub", "关注成功");
		return "queryHomeRecipe";
	}

}
