package com.neusoft.web.impl;

public class CancleshoucangReciServlet extends EmpdsyControllerSupport 
{

	@Override
	public String execute() throws Exception 
	{		
		this.update("cancleShoucang", "ȡ���ղ�");
		this.getInstanceList("queryCollections", "�ղؼ�", "rows");
		this.getInstanceList("querySteps", "����", "rows1");//����
		this.getInstanceList("query", "����", "rows2");//����
		this.getInstanceList("queryPro", "��Ʒ", "rows3");//��Ʒ
		this.getInstanceList("queryLike", "����", "rows4");//����
		this.getInstanceList("queryComment", "����", "rows5");//����
	    this.savePageInstance();
	    
	    return "details";
	}

}
