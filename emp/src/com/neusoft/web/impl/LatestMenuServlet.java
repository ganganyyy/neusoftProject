package com.neusoft.web.impl;

/**
 * ����ʳ��ģ�飨����ʳ�׶�Ӧ��������
 * @author ��ʫ��
 *
 */
public class LatestMenuServlet extends SearchControllerSupport {


	@Override
	public String execute() throws Exception {
		//��ѯ���еĲ���
		this.getInstanceList("queryForLatestMenu", "��ȡ������в��ײ�����","rows");
		
		return "latestMenuList";
	}

}
