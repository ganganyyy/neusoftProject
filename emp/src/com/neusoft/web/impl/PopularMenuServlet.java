package com.neusoft.web.impl;

/**
 * ���а�ģ�飨ʳ���ղ����͵�������
 * @author ��ʫ��
 *
 */
public class PopularMenuServlet extends SearchControllerSupport {


	@Override
	public String execute() throws Exception {
		
		this.getInstanceList("queryForPopularMenu", "��ȡ���а�","rows");
		return null;
	}

}
