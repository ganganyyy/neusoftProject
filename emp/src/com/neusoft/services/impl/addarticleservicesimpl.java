package com.neusoft.services.impl;

import java.text.SimpleDateFormat;
import java.util.Map;

import org.apache.catalina.webresources.AbstractFileResourceSet;

import java.text.SimpleDateFormat;
import java.util.Date;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.JdbcServicesSupport1;

public class addarticleservicesimpl extends JdbcServicesSupport1 
{
     
	public addarticleservicesimpl(Map<String, Object> dto) 
	{
		super(dto);
	}
	
	public Map<String, String>  rank()throws Exception
	{
		String sql =" select aab105 from ab01 where aab101=? ";
		Object args[]=
			{
				this.get("aab101Self")//�û���ˮ��		
			};
		return  this.queryForMap(sql, args);
		
	}
	
	public boolean addarticle()throws Exception
	{
		//sql
		StringBuilder sql=new StringBuilder()
				              .append(" insert into ag01(aag102,aag103,aag104,aag105,")
				              .append("                  aag107,aag108,aag109)  ")
				              .append("  values(?,?,?,?,                 ")
				              .append("            ?,?,?)                 ")
				              ;
		 //����
		Object args[]=
			{
					this.get("aab101Self"),//�˴�Ӧ��̬��ȡ�����ù̶�ֵ
					"01",//
					this.get("aag104"),
					this.get("aag105"),
		new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),
		             "03",//���״̬ Ĭ��ֵΪ03  �����
		new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),			
			};
		
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	

}
 