package com.neusoft.services.impl;

import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
/**
 * ͶƱ�ʸ���,ͶƱ
 * @author ���ɺ
 */
public class VoteServicesImpl extends JdbcServicesSupport 
{
	private Map<String, String> checkByIdVote()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select aae201") 
				.append("  from ae02")
				.append(" where aae101=?")
				.append("   and aab101=?")
				;
		Object args[]={
				this.get("aae101"),
				this.get("aab101Self")
				//this.get("aab101") ����1�û�
		};
		System.out.println("queryForMap"+this.queryForMap(sql.toString(), args));
		return this.queryForMap(sql.toString(), args);
	}
	
	private boolean addVoteOption() throws Exception
	{
		
		StringBuilder sql = new StringBuilder()
				.append("insert into ae02(aae203,aae202,aae204,aae205)")
				.append("     values (?,?,?,CURRENT_TIMESTAMP())")
				;
		System.out.println("�����service��"+this.get("msg"));
		Object args[]={
			//this.get("aae203"),
			this.get("msg"),
			0,
			1
			//this.get("aae204")
		};
		return this.executeUpdate(sql.toString(), args)>0;
		
	}
	
	/**
	 * �����Ƿ���ͶƱ trueͶ��Ʊ falseûͶ��Ʊ
	 * aae303=�û���ˮ��
	 * aae201=ѡ����ˮ��
	 * @return
	 * @throws Exception
	 */
	private Map<String,String> findByIdForVoted()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select c.aae301")
				.append("  from (ae03 c left join ae02 b on b.aae201=c.aae201)") 
				.append("  left join ae01 a on b.aae101=a.aae101")
				.append(" where to_days(c.aae302) = to_days(now())")
				.append("   and c.aae303=?")
				.append("   and c.aae201=?") 
				;
		Object args[]={
			//this.get("aae303"),
			1,
			this.get("aae201")
		};
		
		return this.queryForMap(sql.toString(), args);
	}

	/**
	 * ��ѯ��ͶƱѡ�������ҳ��
	 * 
	 * @return
	 * @throws Exception
	 */
	public Map<String,String> findById()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select c.aab102,a.aae202,a.aae203,a.aae204,b.aae102")
				.append("  from (ae02 a join ae01 b on a.aae101=b.aae101)")
				.append("  join ab01 c on a.aab101=c.aab101")
				.append(" where a.aae201=?")
				;
		
		return this.queryForMap(sql.toString(), this.get("aae201"));
		//return this.queryForMap(sql.toString(),55);
		
	}
	
	private boolean uploadVoteOption()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into ae02(aae203,aae202,aae205)")
				.append("     values (?,?,CURRENT_TIMESTAMP())")
				;
		System.out.println(this.get("aae203"));
		Object args[]={
			this.get("aae203"),
			0
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}

	/**
	 * �û���һ��ѡ�����ͶƱ
	 * insertһ�����ݵ�ͶƱ��
	 * @return
	 * @throws Exception
	 */
	private boolean addVote()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("insert into ae03(aae201,aae302,aae303)")
				.append("          values(?,CURRENT_TIMESTAMP(),?)")
				;
		System.out.println(this.get("aae201"));
		Object args[]={
			this.get("aae201"),
			//�û���ˮ��
			//this.get("aab101")
			1
		};
		return this.executeUpdate(sql.toString(), args)>0;
	}
	
	/**
	 * ����ͶƱ����ͶƱѡ���
	 * ͶƱ��+1
	 * aae201��ѡ����ˮ��,����12��
	 * @return
	 * @throws Exception
	 */
	private boolean addVoteNum()throws Exception
	{
		String sql = "update ae02 set aae202=(aae202+1) where aae201=?";
		//return this.executeUpdate(sql,this.get("aae201"))>0;
		return this.executeUpdate(sql,12)>0;
	}
	

	/**
	 *��������ͶƱѡ��
	 */
	public List<Map<String,String>> query()throws Exception
	{
		StringBuilder sql = new StringBuilder()
				.append("select a.aae201,a.aae202,a.aae203,a.aae204,b.aae107,")
				.append("      b.aae102,b.aae103")
				.append("	 from ae01 b left join ae02 a")
				.append("     on b.aae101=a.aae101")
				.append("  where b.aae101=?;")
				;
		
		return this.queryForList(sql.toString(),this.get("aae101"));
	}
	
	
}
