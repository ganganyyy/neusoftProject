package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
/**
 * 个人厨房我的活动
 * @author 吴佳珊
 */
public class HomeEventServicesImpl extends JdbcServicesSupport
{
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aae203,aae204,aae202")
				.append("  from ae02") 
				.append(" where aab101=?")
				;
		
		return this.queryForList(sql.toString(),this.get("aab101Self"));
		//return this.queryForList(sql.toString(),1);
	}
	
	
	public Map<String,String> findById()throws Exception
	{
		String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";
		return this.queryForMap(sql,this.get("aab101Self"));
		//return this.queryForList(sql.toString(),1);
	}

}
