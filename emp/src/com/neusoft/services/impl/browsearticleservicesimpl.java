package com.neusoft.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.DBUtils;

public class browsearticleservicesimpl extends JdbcServicesSupport 
{

	public browsearticleservicesimpl(Map<String, Object> dto)
	{
		super(dto);
		// TODO Auto-generated constructor stub
	}
	
	public Map<String, String> ad01()throws Exception
	{

		StringBuilder sql= new StringBuilder()
				             .append("  SELECT  aad101 ")
				             .append("   from ad01  ")
				              .append("   where aab101=? and aad103='03' and aad104=?  ");
		//aab202为动态获取的用户号 此处暂用4
		return this.queryForMap(sql.toString(), "4",this.get("aac301"));
	}
	
	
	
	public Map<String, String> ab02()throws Exception
	{

		StringBuilder sql= new StringBuilder()
				             .append("  select aab201 ")
				             .append("   from ab02")
				              .append("   where  aab202=?  and aab203=( select aac306  from ac03 where aac301=?) ");
		//aab202为动态获取的用户号 此处暂用4
		return this.queryForMap(sql.toString(), "4",this.get("aac301"));
	}
	
	
	
	
	
	public List<Map<String, String>> querycomment()throws Exception
	{
		
		StringBuilder sql= new StringBuilder()
				             .append(" select a.aad404,b.aab102 staad405,b.aab106")
				             .append("   from ad04 a,ab01 b ")
				              .append("   where a.aad403=? and b.aab101=a.aad405 ");
		
		List<Object> paramlist=new ArrayList<>();
		Object aac301=this.get("aac301");
		paramlist.add(aac301);
		return this.queryForList(sql.toString(), paramlist.toArray());
	}
	
	
	
	
	
	public Map<String, String> findById()throws Exception
	{
		
		StringBuilder sql= new StringBuilder()
				             .append(" select a.aac302 , a.aac303,b.aab102 staac306,a.aac306 ")
				             .append("   from ac03 a ,ab01 b")
				              .append("   where a.aac301=?  and  a.aac306=b.aab101 ");
		return this.queryForMap(sql.toString(), this.get("aac301"));
	}
	
	
	
	
	
	
	public List<Map<String, String>> query() throws Exception
	  {
		
		  
			  Object qaac302=this.get("qaac302");//标题  模糊查询
			  Object baac305=this.get("baac305");//发布时间b
			  Object eaac305=this.get("eaac305");//发布时间e
			  
			  
			StringBuilder sql=new StringBuilder()
					             .append(" select x.aac301,x.aac302,x.aac303,b.aab102 staac306,x.aac306,x.aac308,x.aac309  ")
					             .append("   from ac03 x , ab01 b ")
					             .append("  where  b.aab101=x.aac306 ");
			List<Object> paramlist=new ArrayList<>();
			
			
			if(this.isNotNull(qaac302))
			{
				sql.append("  and x.aac302  like?");
				paramlist.add("%"+qaac302+"%");
			}
			
			if(this.isNotNull(baac305))
			{
				sql.append("  and x.aac305 >=?");
				paramlist.add(baac305);
			}
			if(this.isNotNull(eaac305))
			{
				sql.append("  and x.aac306 <=?");
				paramlist.add(eaac305);
			}
			
			sql.append(" order by x.aac305");
			System.out.println(sql.toString());
			System.out.println(paramlist);
			
			return this.queryForList(sql.toString(), paramlist.toArray());
			
			
		
		  
	  }
	
	
	

}
