package com.neusoft.services.impl;

import java.text.SimpleDateFormat;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class browsefindByIdarticleservicesimpl extends JdbcServicesSupport 
{
   
	public browsefindByIdarticleservicesimpl(Map<String, Object> dto) 
	{
		super(dto);
		// TODO Auto-generated constructor stub
	}
	
	public boolean addcomment()throws Exception
	{
		
		StringBuilder sql=new StringBuilder()
				             .append("insert into ad04(aad402,aad403,aad404,aad405) ") 
				             .append(" values(?,?,?,? )    ") 
				              ;
		
		Object args[]=
			{
					"03",//ר������
					this.get("aac301"),
					this.get("aad404"),
					"04"//�û���ˮ�ţ���̬��ȡ�����ù̶�ֵ
								
			};
		
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	
	
	public boolean guanzhu()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				               .append("insert into ab02(aab202,aab203) ")
				               
				               .append(" values(?,?)  ");
		Object args[]=
			{
					"04",//�û���ˮ�ţ����ù̶�ֵ
					this.get("aac306"),//����ע�û�
					
			};
				return this.executeUpdate(sql.toString(), args)>0;               
	}
	 
	public boolean quxiaoguanzhu()throws Exception
	{
		String sql="delete from ab02 where  aab202=? and aab203=( select aac306  from ac03 where aac301=?) ";
		//�˴����ȡ�û���ˮ�� ���ù̶�ֵ
		return this.executeUpdate(sql.toString(),"4", this.get("aac301"))>0;
		
	}
	
	
	
	public void jiayidianzan()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				          .append("update  ac03 ")
				          .append("   set aac308=aac308+1")
				          .append("  where aac301=? ");
		Object args[]=
			{		
					this.get("aac301")		
			};   
		 this.executeUpdate(sql.toString(), args);
	}
	public void jianyidianzan()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				          .append("update  ac03 ")
				          .append("   set aac308=aac308-1")
				          .append("  where aac301=? ");
		Object args[]=
			{		
					this.get("aac301")		
			};   
		 this.executeUpdate(sql.toString(), args);
	}
	
	public boolean quxiaodianzan()throws Exception
	{
		String sql="delete from ad01 where aad103='03' and aab101=? and aad104=? ";
		//�˴����ȡ�û���ˮ�� ���ù̶�ֵ
		return this.executeUpdate(sql.toString(),"4", this.get("aac301"))>0;
		
	}
	
	public boolean dianzan()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				               .append("insert into ad01(aab101,aad102,aad103,aad104) ")
				               
				               .append(" values(?,?,?,?)  ");
		Object args[]=
			{
					"04",//�û���ˮ�ţ����ù̶�ֵ
					new SimpleDateFormat("yy-MM-dd HH-mm-ss").format(new java.util.Date()),
					"03",
					this.get("aac301")//
			};
				return this.executeUpdate(sql.toString(), args)>0;               
	}
	
}
