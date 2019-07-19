package com.neusoft.web.impl;
/**
 * 
 * @author Îâ¼ÑÉº
 *
 */
public class AddSubscribeServlet extends SubscribeControllerSupport
{

	@Override
	public String execute() throws Exception 
	{
		this.update("addSub", "¹Ø×¢³É¹¦");
		return "queryHomeWork";
	}

}
