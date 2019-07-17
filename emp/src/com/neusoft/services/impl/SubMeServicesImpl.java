package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class SubMeServicesImpl extends JdbcServicesSupport 
{

	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab106") 
				.append("  from ab01 a left join ab02 b on a.aab101=b.aab202") 
				.append(" where b.aab203=?") 
				;
		return this.queryForList(sql.toString(), 3);
	}
	
}