package com.neusoft.web.impl;

/**
 * �����û���ʾ
 * @author ��ʫ��
 *
 */
public class UserOnlineServlet extends Ab01ControllerSupport {

	@Override
	public String execute() throws Exception {
		
		this.getInstance("findByAab101","�����ڸ��û���Ϣ","ins");
		return null;
	}

}
