package com.neusoft.web.impl;

import java.util.List;
import java.util.Map;
/**
 * 申请升级计算总分
 * @author 吴佳珊
 */
public class UpgradeCountServlet extends PersonalControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.savePageInstance();
		this.getInstance("findByIdPhoto", "", "photo");
		return "upgrade";
	}

}
