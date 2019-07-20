package com.neusoft.web.impl;

import com.neusoft.web.support.ControllerSupport;

/**
 * 退出登录，移除session中的流水号在BaseServlet2中操作
 * @author 刘诗滢
 *
 */
public class UserExitServlet extends Ab01ControllerSupport{


	@Override
	public String execute() throws Exception {
		
		return "exit";
	}

}
