package com.neusoft.web.impl;

public class UserOnlineServlet extends Ab01ControllerSupport {

	@Override
	public String execute() throws Exception {
		
		this.getInstance("findByAab101","不存在该用户信息","ins");
		return null;
	}

}
