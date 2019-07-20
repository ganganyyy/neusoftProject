package com.neusoft.web.impl;

/**
 * 获取所有的食谱
 * @author 刘诗滢
 *
 */
public class AllMenuServlet extends SearchControllerSupport {

	@Override
	public String execute() throws Exception {
		System.out.println("enter Servlet");
		this.getInstanceList("queryMenuForType", "没有对应食谱信息", "rows");
		this.getInstance("queryForType", "没有该菜系类型", "ins");
		return "AllMenu";
	}

}
