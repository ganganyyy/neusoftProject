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
	 * �û�δ�ﵽ500���ύ������������Ա���
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
				"�û���������",
				"03"	
		};
		return this.executeUpdate(sql.toString(), args)>0;
		
	}
	
	/**
	 * �����û���VIP
	 */
	private boolean upgrade()throws Exception
	{

		String sql ="update ab01 set aab105=02 where aab101=?";
		//return this.executeUpdate(sql, 1)>0;
		return this.executeUpdate(sql, this.get("aab101Self"))>0;
	}
	
	
	
	
	/**
	 * ��ѯ�û��ܷ�,����500����true
	 * @return
	 * @throws Exception
	 */
	private boolean countSum()throws Exception
	{
		int sum;
		sum=this.countRecipeLAndC()
			+this.countShareLAndC()
			+2*this.countSubscribe();
		System.out.println("�û��ܷ�"+sum);
		//System.out.println(flag);
		return sum>500;
	}
	
	/**
	 * ������ѯ���û����е�ʳ�׵ĵ��������ղ���
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
		System.out.println("ʳ�׵ĵ��������ղ���"+total);
		return total;
	}
	/**
	 * ������ѯ���û����е���Ʒ�ĵ��������ղ���
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
		System.out.println("��Ʒ�ĵ��������ղ���"+total);
		return total;
	}
	
	
	/**
	 * ��ѯ�û��ı���ע����
	 */
	private int countSubscribe()throws Exception
	{
		String sql = "select aab108 from ab01 where aab101=?";
		//Map<String,String> map=this.queryForMap(sql, 1);
		Map<String,String> map=this.queryForMap(sql, this.get("aab101Self"));
		int total=Integer.parseInt(map.get("aab108"));
		System.out.println("�û��ı���ע��"+total);
		return total;
	}
	
	/**
	 *�������л
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
