package com.neusoft.web.impl;

public class CancleCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteColle", "取消收藏");
		this.getInstanceList("queryCollReci", "菜谱", "reci");
		this.getInstanceList("queryCollPro", "作品", "pro");
		this.getInstanceList("queryCollComp", "专栏", "comp");
		return "queryHomeColl";
	}

}
