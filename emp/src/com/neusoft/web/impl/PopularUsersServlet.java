package com.neusoft.web.impl;

/**
 * �����û�ģ��
 * @author ��ʫ��
 *
 */
public class PopularUsersServlet extends Ab01ControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.getInstanceList("queryForPopularUsers", "��ȡ�����û�������","rows");
		return null;
	}

}
