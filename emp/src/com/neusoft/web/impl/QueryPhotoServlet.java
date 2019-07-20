package com.neusoft.web.impl;
/**
 * ÐÞ¸ÄÍ·Ïñ
 * @author Îâ¼ÑÉº
 */
public class QueryPhotoServlet extends MessageControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		this.savePageInstance();
		return "uploadPhoto";
	}

}
