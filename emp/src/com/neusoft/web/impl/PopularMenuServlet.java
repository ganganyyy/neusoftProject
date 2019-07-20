package com.neusoft.web.impl;

public class PopularMenuServlet extends SearchControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.getInstanceList("queryForPopularMenu", "ªÒ»°≈≈––∞Ò","rows");
		return null;
	}

}
