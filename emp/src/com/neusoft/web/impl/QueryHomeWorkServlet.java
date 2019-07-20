package com.neusoft.web.impl;

import com.neusoft.services.impl.HomeWorkServicesImpl;
/**
 * 用户搜索厨房所有作品
 * @author 吴佳珊
 */
public class QueryHomeWorkServlet extends HomeWorkControllerSupport 
{
	@Override
	public String execute()throws Exception
	{
		this.savePageInstance();
		this.savePageData();
		return "queryHomeWork";
		
	}
	

}
