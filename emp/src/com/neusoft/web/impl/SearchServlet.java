package com.neusoft.web.impl;

/**
 * 搜索
 * @author 刘诗滢
 *
 */
public class SearchServlet extends SearchControllerSupport {

	@Override
	public String execute() throws Exception {
		//service中取出来inputHunt进行分词，然后根据不同的搜索需求进行模糊搜取
		//搜索结果放入rows中
		//return this.getIntanceListForOption();		
		return this.getIntanceListForOption();
	}

}
