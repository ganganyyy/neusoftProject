package com.neusoft.web.impl;

public class RegisteServlet extends Ab01ControllerSupport {

	
	@Override
	public String execute() throws Exception {
		this.getInstance("findByTel", "���ֻ��Ż�δע��");
		if(this.checkIns())
		{
			//�ֻ����ѱ�ע��
			//����msg��ԭ���this.getInstance����
			this.saveAttribute("msg", "���ֻ��ѱ�ע��");
			return "registe";
		}
		else
		{
			//δ��ע�ᣬ�������ݿ�
			this.update("addAb01", "ע��");
			return "result";
		}
	}

}
