package com.neusoft.web.impl;

public class CreAndCollServlet extends EmpdsyControllerSupport 
{
	@Override
	public String execute() throws Exception 
	{
		System.out.println("7777777");
		this.update("createColl", "����");
		System.out.println("666666666");
		this.savePageInstance();
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		this.getInstanceList("querySteps", "����", "rows1");//����
		this.getInstanceList("query", "����", "rows2");//����
		this.getInstanceList("queryPro", "��Ʒ", "rows3");//��Ʒ
		this.getInstanceList("queryLike", "����", "rows4");//����
		this.getInstanceList("queryComment", "����", "rows5");//����
		return "details";
	}

}
