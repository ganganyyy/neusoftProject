//author:������
package com.neusoft.web.impl;

public class CancleCollServlet extends ColControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		this.update("deleteColle", "ȡ���ղ�");
		this.savePageInstance();
		this.getInstanceList("queryCollReci", "����", "reci");
		this.getInstanceList("queryCollPro", "��Ʒ", "pro");
		this.getInstanceList("queryCollComp", "ר��", "comp");
		return "queryHomeColl";
	}

}
