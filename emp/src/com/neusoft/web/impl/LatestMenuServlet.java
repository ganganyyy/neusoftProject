package com.neusoft.web.impl;

/**
 * 流行食谱模块（根据食谱对应作评数）
 * @author 刘诗滢
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
