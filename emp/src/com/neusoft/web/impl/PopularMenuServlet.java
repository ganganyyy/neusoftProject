package com.neusoft.web.impl;

/**
 * 排行榜模块（食谱收藏数和点赞数）
 * @author 刘诗滢
 *
 */
public class PopularMenuServlet extends SearchControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.getInstanceList("queryForPopularMenu", "获取排行榜","rows");
		return null;
	}

}
