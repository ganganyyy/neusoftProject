package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
/**
 * 个人厨房我的菜谱
 * @author 吴佳珊
 */
public class HomeRecipeServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aac102,a.aac108,a.aac101")
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

	 //判断是否关注 
	private Map<String, String> ifSub()throws Exception
	{
		String sql="select aab201 from ab02 where aab202=? and aab203=? ";
		Object args[]={
				this.get("aab101Self"),
				this.get("aab101")
				};
		return this.queryForMap(sql, args);
	}
}
