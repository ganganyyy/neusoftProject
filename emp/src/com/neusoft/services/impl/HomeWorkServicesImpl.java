package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
/**
 * 个人厨房 我的作品
 * @author 吴佳珊
 */
public class HomeWorkServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aac102,c.aac204,b.aab102,b.aab106")
				.append("  from (ac02 c join ac01 a on c.aac207=a.aac101)")
				.append("              join ab01 b on a.aac106=b.aab101")
				.append(" where c.aab101=?")
				;
		return this.queryForList(sql.toString(), this.get("aab101"));
	}
	
	public Map<String,String> findById()throws Exception
	{
		String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";
		
		return this.queryForMap(sql,this.get("aab101"));
		//return this.queryForList(sql.toString(),1);
	}


}
