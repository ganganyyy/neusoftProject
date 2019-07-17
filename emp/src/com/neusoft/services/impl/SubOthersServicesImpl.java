package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class SubOthersServicesImpl extends JdbcServicesSupport 
{

	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab106") 
				.append("  from ab01 a join ab02 b on a.aab101=b.aab203")
				.append(" where b.aab202=?")
				;
		return this.queryForList(sql.toString(), 3);
	}
	
	private boolean deleteById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("delete from ab02") 
                .append(" where aab203=? and aab202=?")
                ;
		Object args[]={
				this.get("aab203"),
				3 //this.get("aab101")
		};
		return this.executeUpdate(sql.toString(),args)>0;
				
	}
}
