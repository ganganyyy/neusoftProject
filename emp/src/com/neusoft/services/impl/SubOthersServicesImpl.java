package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
/**
 * 我关注别人
 * @author 吴佳珊
 */
public class SubOthersServicesImpl extends JdbcServicesSupport 
{

	    //关注
		private boolean addSub()throws Exception
	    {
			//当前账号用户
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
	    	
	    	//当前用户关注数加1
	    	StringBuilder sql2=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab107=a.aab107+1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql2.toString(), this.get("aab101Self"));
	    	
	    	//菜谱用户被关注数加1
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
	
	//取消关注
		private boolean deleteById()throws Exception
	    {
	    	String sql1="delete from ab02 where aab201=?";
	    	this.apppendSql(sql1, this.get("aab201"));
	    	
	    	//当前用户关注数减1
	    	StringBuilder sql2=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab107=a.aab107-1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql2.toString(), this.get("aab101Self"));
	    	
	    	//菜谱用户被关注数减1
	    	StringBuilder sql3=new StringBuilder()
	    			.append("update ab01 a")
	    			.append("   set a.aab108=a.aab108-1")
	    			.append(" where a.aab101=?")
	    			;
	    	this.apppendSql(sql3.toString(), this.get("aab101"));
	    	return this.executeTransaction();
	    }

		

}
