package com.neusoft.web.impl;

/**
 * �����û�ģ��
 * @author gangan
 *
 */
public class PopularUsersServlet extends Ab01ControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.getInstanceList("queryForPopularUsers", "��ȡ�����û�������");
		return null;
	}

}
