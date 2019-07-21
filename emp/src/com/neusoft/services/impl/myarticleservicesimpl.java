package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.services.JdbcServicesSupport1;

public class myarticleservicesimpl extends JdbcServicesSupport1 {

	public myarticleservicesimpl(Map<String, Object> dto) {
		super(dto);
		// TODO Auto-generated constructor stub
	}
	
	public Map<String, String> findById()throws Exception
	{
		
		StringBuilder sql= new StringBuilder()
				             .append(" select a.aac302,a.aac303,a.aac306 ")
				             .append("   from ac03 a ")
				              .append("  where  a.aac301=?");
		return this.queryForMap(sql.toString(), this.get("aac301"));
	}
	public boolean deletemyarticle()throws Exception
	{
		String sql ="delete from ac03 where aac301=?";
		return this.executeUpdate(sql, this.get("aac301"))>0;
		
	}
	
	public List<Map<String, String>> query() throws Exception
	  {
		
			  Object aac302=this.get("qaac302");//标题  模糊查询
			  Object baac305=this.get("baac305");//申请时间b
			  Object eaac305=this.get("eaac305");//申请时间e
			  
			  
			StringBuilder sql=new StringBuilder()
					.append("  select x.aac301,x.aac302,x.aac303,x.aac305,x.aac307,x.aac308,x.aac309 ")
					.append("	 from ac03 x   ")
					.append(" where  aac306=?  ");
			List<Object> paramlist=new ArrayList<>();
			this.get("aab101Self");//此处应动态获取流水号  暂用固定值
			
			if(this.isNotNull(aac302))
			{
				sql.append("  and x.aac302  like?");
				paramlist.add("%"+aac302+"%");
			}
			
			if(this.isNotNull(baac305))
			{
				sql.append("  and x.aac305 >=?");
				paramlist.add(baac305);
			}
			if(this.isNotNull(eaac305))
			{
				sql.append("  and x.aagc305 <=?");
				paramlist.add(eaac305);
			}
			
			sql.append(" order by x.aac305");
			System.out.println(sql.toString());
			System.out.println(paramlist);
			
			return this.queryForList(sql.toString(), paramlist.toArray());
		  
	  
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
	
	
	
}
