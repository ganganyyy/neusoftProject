package com.neusoft.web.impl;

/**
 * 人气用户模块
 * @author 刘诗滢
 *
 */
public class PopularUsersServlet extends Ab01ControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.getInstanceList("queryForPopularUsers", "获取人气用户不存在","rows");
		return null;
	}

}
