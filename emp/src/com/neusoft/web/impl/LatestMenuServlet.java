package com.neusoft.web.impl;

/**
 * 流行食谱模块（根据做过的人数）
 * @author gangan
 *
 */
public class LatestMenuServlet extends SearchControllerSupport {


	@Override
	public String execute() throws Exception {
		//查询所有的菜谱
		this.getInstanceList("queryForLatestMenu", "获取最近流行菜谱不存在","rows");
		
		return "latestMenuList";
	}

}
