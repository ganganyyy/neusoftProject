package com.neusoft.services.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.db.DBUtils;
import com.neusoft.system.tools.Tools;

public class Ac01ServicesImpl extends JdbcServicesSupport 
{
	
	//����
	private boolean shoucang()throws Exception
    {
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad301,aad202,aad203,aad204)")
    			.append("          values('1',NOW(),'01',?)")
    			;
    	//ʳ����ˮ�� this.get("aac101")=20
    	Object args1[]={"20"};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac110=a.aac110+1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={"20"};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
	
	//ȡ���ղ�
    private boolean cancleShoucang()throws Exception
    {
    	String sql1="delete from ad02 where aad203='01' and aad301='1' and aad204=? ";
    	//ʳ����ˮ�� this.get("aac101")=20
    	Object args1[]={"20"};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac110=a.aac110-1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={"20"};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
	
    //�ж��Ƿ��ղ� value��Ϊ�ռ����ղ�
	private String shoucangNumber()throws Exception
	{
		List<Map<String,String>> rows = new ArrayList<>();
		
		String sql="select aad201 from ad02 where aad301='1' and aad203='01' and aad204=? ";
		
		//ʳ����ˮ�� this.get("aac101")=20
		Object args[]={"20"};
		
		String aad201 = null;
		String value = null;
		rows = this.queryForList(sql, args);
	    for (Map<String, String> m :rows)
	    {
	        for(Map.Entry<String, String> vo : m.entrySet())
	        {
	            aad201=vo.getKey();
	            value=vo.getValue();
	            System.out.println(vo.getKey()+"  "+vo.getValue());
	        }
	    }    	
		return value;
	}
	
	//����
	private boolean giveLike()throws Exception
    {
    	String aab101="1";
    	this.put("aab101", aab101);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad01(aab101,aad102,aad103,aad104)")
    			.append("          values(?,NOW(),'01',?)")
    			;
    	//ʳ����ˮ�� this.get("aac101")=20
    	Object args1[]={aab101,"20"};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac109=a.aac109+1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={"20"};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
	
	//ȡ������
    private boolean cancleLike()throws Exception
    {
    	String aab101="1";
    	this.put("aab101", aab101);
    	
    	String sql1="delete from ad01 where aad103='01' and aab101=? and aad104=? ";
    	//ʳ����ˮ�� this.get("aac101")=20
    	Object args1[]={aab101,"20"};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac01 a")
    			.append("   set a.aac109=a.aac109-1")
    			.append(" where a.aac101=?")
    			;
    	Object args2[]={"20"};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
	
    //�ж��Ƿ���� value��Ϊ�ռ��ѵ���
	private String likeNumber()throws Exception
	{ 
		//�û���ˮ��
		String aab101="1";
		this.put("aab101", aab101);
		
		List<Map<String,String>> rows = new ArrayList<>();
		
		String sql="select aad101 from ad01 where aad103='01' and aad104=? and aab101=? ";
		
		//ʳ����ˮ�� this.get("aac101")=20
		Object args[]={"20",aab101};
		
		String aad101 = null;
		String value = null;
		rows = this.queryForList(sql, args);
	    for (Map<String, String> m :rows)
	    {
	        for(Map.Entry<String, String> vo : m.entrySet())
	        {
	            aad101=vo.getKey();
	            value=vo.getValue();
	            //System.out.println(vo.getKey()+"  "+vo.getValue());
	        }
	    }    	
		return value;
	}

    //��ѯ����
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac102,date_format(a.aac103,'%Y-%m-%d' ) aac103,a.aac104,a.aac105,a.aac106,")
    			.append("       a.aac107,a.aac108")
    			.append("  from ac01 a")
    			.append(" where a.aac101=?")
    			;
    	//ִ�в�ѯ
    	Map<String,String> recidto = this.queryForMap(sql.toString(), "20");
    	
    	String likeNumber=likeNumber();
    	recidto.put("aad101", likeNumber);
    	String shoucangNumber=shoucangNumber();
    	recidto.put("aad201", shoucangNumber);
    	return recidto;
    }
    
      //��ѯ����
	  public List<Map<String,String>> querySteps()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac402,a.aac403,a.aac404")
	    			.append("  from ac04 a")
	    			.append(" where a.aac101=? order by a.aac404 asc")
	    			;
	    	return this.queryForList(sql.toString(), "20");
	  }
	  
	  //��ѯ����
	  public List<Map<String,String>> query()throws Exception
	  {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aac602,a.aac603")
	    			.append("  from ac06 a")
	    			.append(" where a.aac101=?")
	    			;
	    	return this.queryForList(sql.toString(), "20");
	  }
    
	    //ɾ������
	    public boolean deleteById()throws Exception
	    {
	    	String sql="delete from ac01 where aac101=?";
	    	return this.executeUpdate(sql, "2")>0;
	    }
	    
		//�������
		public boolean addInsg(Map<String,Object> dto,int i)throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac06(aac101,aac602,aac603)")
	    			.append("          values(?,?,?)")
	    			;
	    	//2.��д��������
	    	Object args[]={
	    			dto.get("aac101"),
	    			dto.get(i+"aac602"),
	    			dto.get(i+"aac603")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
		
		//��Ӳ���
		public boolean addStep(Map<String,Object> dto,int i)throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac04(aac101,aac402,aac403,aac404)")
	    			.append("          values(?,?,?,?)")
	    			;
	    	//2.��д��������
	    	Object args[]={
	    			dto.get("aac101"),
	    			dto.get(i+"aac402"),
	    			dto.get("aac403"),
	    			dto.get(i+"aac404")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
		
		//��Ӳ���
	    public boolean addReci(Map<String,Object> dto)throws Exception
	    {
	    	
	        //aac106 ��ǰ�û���ˮ��
	    	String aac106="1";
	        dto.put("aac106", aac106);
	        
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ac01(aac102,aac103,aac104,aac105,aac106,")
	    			.append("                 aac107,aac108,aac109,aac110)")
	    			.append("          values(?,NOW(),null,?,?,")
	    			.append("                 ?,?,'0','0')")
	    			;
	    	//2.��д��������
	    	Object args[]={
	    			dto.get("aac102"),
	    			dto.get("aac105"),
	    			dto.get("aac106"),
	    			dto.get("aac107"),
	    			dto.get("aac108")
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
}
