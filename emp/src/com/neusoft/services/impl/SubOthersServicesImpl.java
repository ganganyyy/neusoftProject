package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
/**
 * �ҹ�ע����
 * @author ���ɺ
 */
public class SubOthersServicesImpl extends JdbcServicesSupport 
{

	    //��ע
		private boolean addSub()throws Exception
	    {
			//��ǰ�˺��û�
			//String aab202="1";
			//this.put("aab202", aab202);
	    	
	    	StringBuilder sql1=new StringBuilder()
	    			.append("insert into ab02(aab202,aab203)")
	    			.append("       values(?,?)")
	    			;
	    	Object args1[]={
	    			this.get("aab101Self"),
	    			this.get("aab101")
	    			};
	    	this.apppendSql(sql1.toString(), args1);
	    	
	    	//��ǰ�û���ע����1
	    	StringBuilder sql2=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab107=a.aab107+1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql2.toString(), this.get("aab101Self"));
	    	
	    	//�����û�����ע����1
	    	StringBuilder sql3=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab108=a.aab108+1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql3.toString(), this.get("aab101"));
	    	
	    	return this.executeTransaction();
	    }
		

	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab106,b.aab201") 
				.append("  from ab01 a join ab02 b on a.aab101=b.aab203")
				.append(" where b.aab202=?")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
	
	//ȡ����ע
		private boolean deleteById()throws Exception
	    {
	    	String sql1="delete from ab02 where aab201=?";
	    	this.apppendSql(sql1, this.get("aab201"));
	    	
	    	//��ǰ�û���ע����1
	    	StringBuilder sql2=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab107=a.aab107-1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql2.toString(), this.get("aab101Self"));
	    	
	    	//�����û�����ע����1
	    	StringBuilder sql3=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab108=a.aab108-1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql3.toString(), this.get("aab101"));
	    	return this.executeTransaction();
	    }

		

}
