package com.neusoft.web.impl;

public class LikeReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{
		
		this.update("giveLike", "����");
		System.out.println("0000000000000");
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
