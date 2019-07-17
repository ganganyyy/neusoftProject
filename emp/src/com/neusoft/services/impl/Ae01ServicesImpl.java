package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ae01ServicesImpl extends JdbcServicesSupport 
{
	
//	private boolean todayVoted()throws Exception
//	{
//	
//		StringBuilder sql = new StringBuilder()
//				.append("")
//				
//	}
	
	private boolean addEvent()throws Exception
	{
		//��дSQL���
		StringBuilder sql = new StringBuilder()
				.append("insert into ae01(aae102,aae103,aae104,aae105,aae106,")
				.append("                 aae107)")
				.append("          values(?,?,?,?,CURRENT_TIMESTAMP(),")
				.append("                 ?)")
				;
		//��д��������
		Object args[]={
    			this.get("aae102"),
    			this.get("aae103"),
    			this.get("aae104"),
    			this.get("aae105"),
    			this.get("aae107")
    	};
		return this.executeUpdate(sql.toString(), args)>0;
				
	}
	
	private boolean addEventOption()throws Exception

	{
		//��ȡ��ǰ�����
		int aae101=Tools.getSequence("aae101");
		System.out.println(aae101);
		this.put("aae101", aae101);
		//��дSQL���
		StringBuilder sql1 = new StringBuilder()
				.append("insert into ae02(aae101,aab101,aae202,aae203,aae205)")
				.append("          values(?,?,?,?,CURRENT_TIMESTAMP())")
				;
		//��д��������
//		System.out.println(this.get("1aae203"));
//		System.out.println(this.get("2aae203"));
		Object args1[]={
    			this.get("aae101"),
    			1,
    			0,
    			this.get("1aae203")
    	};
		//��д��������
		Object args2[]={
		    	this.get("aae101"),
		    	1,
		    	0,
		    	this.get("2aae203")
		};
		
	boolean flag=this.executeUpdate(sql1.toString(), args1)>0;
    flag=flag&&this.executeUpdate(sql1.toString(), args2)>0;
    return flag;
				
	}
	

	
	/**
	 *�������л
	 */
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aae101,aae102,aae103,aae104,aae105")
				.append("  from ae01")
				.append(" order by aae104 desc")
				;
		return this.queryForList(sql.toString());
	}
	
	public boolean deleteById()throws Exception
	{
		//����SQL���
		String sql="delete from ae01 where aae101=?";
		return this.executeUpdate(sql, this.get("aae101"))>0;
	}
}
