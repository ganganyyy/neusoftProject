package com.neusoft.web.impl;

/**
 * ��ȡ���е�ʳ��
 * @author ��ʫ��
 *
 */
public class AllMenuServlet extends SearchControllerSupport {

	@Override
	public String execute() throws Exception {
		System.out.println("enter Servlet");
		this.getInstanceList("queryMenuForType", "û�ж�Ӧʳ����Ϣ", "rows");
		this.getInstance("queryForType", "û�иò�ϵ����", "ins");
		return "AllMenu";
	}

}
