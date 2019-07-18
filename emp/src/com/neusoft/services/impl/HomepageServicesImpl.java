package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;

public class HomepageServicesImpl extends JdbcServicesSupport 
{
	private boolean checkPassword()throws Exception
	{
		String sql = "select aab103 from ab01 where aab101=?";
				
		//Map<String, String> map=this.queryForMap(sql, this.get("aab101"));
		Map<String, String> map=this.queryForMap(sql, 5);
		String a=map.get("aab103");
		if(a.equals(this.get("oldaab103")))
		{
			return true;
		}
		else
		{
	    return false;
		}
	}
	
	
	private boolean updateInfo()throws Exception
	{
		
		StringBuilder sql = new StringBuilder()
				.append("update ab01 a")
				.append("   set a.aab102=?,a.aab103=?")
				.append(" where a.aab101=?")
				;
		
		Object args[]={
				this.get("aab102"),
				this.get("aab103"),
				this.get("aab101Self")
		};
		
		return this.executeUpdate(sql.toString(), args)>0;
		
	}
	
	/**
	 * 用户未达到500分提交至申请表由审核员审核
	 * @return
	 * @throws Exception
	 */
	private boolean applyUpdate()throws Exception
	{
		
		StringBuilder sql = new StringBuilder()
				.append("insert into ag01(aag102,aag103,aag104,aag107,aag108)")
				.append("          values(?,?,?,CURRENT_TIMESTAMP(),?)")
				;
		
		Object args[]={
				this.get("aab101Self"),
				"02",
				"用户申请升级",
				"03"	
		};
		return this.executeUpdate(sql.toString(), args)>0;
		
	}
	
	/**
	 * 升级用户至VIP
	 */
	private boolean upgrade()throws Exception
	{

		String sql ="update ab01 set aab105=02 where aab101=?";
		//return this.executeUpdate(sql, 1)>0;
		return this.executeUpdate(sql, this.get("aab101Self"))>0;
	}
	
	
	
	
	/**
	 * 查询用户总分,大于500返回true
	 * @return
	 * @throws Exception
	 */
	private boolean countSum()throws Exception
	{
		int sum;
		sum=this.countRecipeLAndC()
			+this.countShareLAndC()
			+2*this.countSubscribe();
		System.out.println("用户总分"+sum);
		//System.out.println(flag);
		return sum>500;
	}
	
	/**
	 * 批量查询该用户所有的食谱的点赞数和收藏数
	 */
	private int countRecipeLAndC()throws Exception
	{
		StringBuilder sql= new StringBuilder()
				.append("select Sum(aac109)+SUM(aac110) as total")
				.append("  from ac01")
				.append(" where aac106=?")
				;
		
		//Map<String,String> map=this.queryForMap(sql.toString(),1);
		Map<String,String> map=this.queryForMap(sql.toString(),this.get("aab101Self"));
		
		int total=Integer.parseInt(map.get("total"));
		System.out.println("食谱的点赞数和收藏数"+total);
		return total;
	}
	/**
	 * 批量查询该用户所有的作品的点赞数和收藏数
	 */
	private int countShareLAndC()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select Sum(aac205)+Sum(aac206) as total")
				.append("  from ac02")
				.append(" where aab101=?")
				;
		Map<String,String> map = this.queryForMap(sql.toString(), this.get("aab101Self"));
		//Map<String,String> map = this.queryForMap(sql.toString(), 1);
		int total=Integer.parseInt(map.get("total"));
		System.out.println("作品的点赞数和收藏数"+total);
		return total;
	}
	
	
	/**
	 * 查询用户的被关注人数
	 */
	private int countSubscribe()throws Exception
	{
		String sql = "select aab108 from ab01 where aab101=?";
		//Map<String,String> map=this.queryForMap(sql, 1);
		Map<String,String> map=this.queryForMap(sql, this.get("aab101Self"));
		int total=Integer.parseInt(map.get("aab108"));
		System.out.println("用户的被关注数"+total);
		return total;
	}
	
	/**
	 *搜索所有活动
	 */
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select sum(a.aac109)+sum(b.aac206) as totalLikes,")
				.append("       sum(a.aac110)+sum(b.aac205) as totalCollects,")
				.append("       sum(c.aab108) as totalSub")
				.append("  from (ac01 a left join ac02 b on a.aac106=b.aab101)")
				.append("               left join ab01 c on a.aac106=c.aab101")
				.append("  where a.aac106=?")
				;
		return this.queryForMap(sql.toString(),this.get("aab101Self"));
		//return this.queryForList(sql.toString(),this.get("aab101"));
	}
	
	public Map<String,String> findByIdPhoto()throws Exception
	{
		String sql ="select aab106 from ab01 where aab101=?";
		return this.queryForMap(sql, this.get("aab101Self"));
	}
	

}
