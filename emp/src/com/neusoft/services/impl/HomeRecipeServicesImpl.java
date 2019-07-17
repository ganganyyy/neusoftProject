package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class HomeRecipeServicesImpl extends JdbcServicesSupport 
{

//	public List<Map<String,String>> query()throws Exception
//	{
//		StringBuilder sql = new StringBuilder()
//				.append("select a.aac102,a.aac108,b.aab102,b.aab106")
//				.append("  from (ac01 a left join ab01 b on a.aac106=b.aab101)") 
//				.append(" where aac106=?")
//				;
//		
//		return this.queryForList(sql.toString(),this.get("aab101"));
//		//return this.queryForList(sql.toString(),1);
//	}
	
	
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aac102,a.aac108")
				.append("  from (ac01 a left join ab01 b on a.aac106=b.aab101)") 
				.append(" where aac106=?")
				;
		
		return this.queryForList(sql.toString(),this.get("aab101"));
		//return this.queryForList(sql.toString(),1);
	}
	
	
	public Map<String,String> findById()throws Exception
	{
		String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";
		
		return this.queryForMap(sql,this.get("aab101"));
		//return this.queryForList(sql.toString(),1);
	}
//	
//	private boolean deleteById()throws Exception
//	{
//		String sql ="";
//		return this.executeUpdate(sql, args)>0;
//	}
	
}
