package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
/**
 * 系统消息管理
 * @author 吴佳珊
 */
public class Ab03ServicesImpl extends JdbcServicesSupport 
{
	public List<Map<String,String>>query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aab301,aab302,aab303,aab304")
				.append("  from ab03")
				.append(" where aab101=?")
				;
		return this.queryForList(sql.toString(), this.get("aab101Self"));
	}
	
	private boolean deleteById()throws Exception
	{
		String sql ="delete from ab03 where aab301=?";	
		return this.executeUpdate(sql, this.get("aab301"))>0;
	}
	
	private boolean batchDelete()throws Exception
	{
		String sql ="delete from ab03 where aab301=?";
		String idlist[]=this.getIdList("idlist");
		return this.batchUpdate(sql,idlist);
	}
	
	public Map<String,String> findById()throws Exception
	{
		String sql ="select aab106 from ab01 where aab101=?";
		return this.queryForMap(sql, this.get("aab101Self"));
	}
	

}
