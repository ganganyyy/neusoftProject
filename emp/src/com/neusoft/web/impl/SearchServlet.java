package com.neusoft.web.impl;

/**
 * ����ģ��
 * @author gangan
 *
 */
public class SearchServlet extends SearchControllerSupport {

	@Override
	public String execute() throws Exception {
		//service��ȡ����inputHunt���зִʣ�Ȼ����ݲ�ͬ�������������ģ����ȡ
		//�����������rows��
		//return this.getIntanceListForOption();		
		return this.getIntanceListForOption();
	}

}
