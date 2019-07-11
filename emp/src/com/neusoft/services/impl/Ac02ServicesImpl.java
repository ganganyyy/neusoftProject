package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;

public class Ac02ServicesImpl extends JdbcServicesSupport 
{	
	//��ѯ������Ʒ
    public List<Map<String,String>> query()throws Exception
    {
    	//1.��дSQL���
    	String sql="select aac201,aab101,aac202,aac203,aac204,aac207 from ac02";
    	//ִ�в�ѯ
    	return this.queryForList(sql);
    }
    
    //��ѯĳһ��Ʒ����
    public Map<String,String> findById()throws Exception
    {    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac201,a.aab101,a.aac202,a.aac203,a.aac204,")
    			.append("       a.aac207,c.aac102,b.aab102,b.aab106")
    			.append("  from ac02 a, ab01 b, ac01 c")
    			.append(" where a.aac207=c.aac101")
    			.append("   and a.aac201=?")
    			;
    	//ִ�в�ѯ
    	Map<String,String> abc = this.queryForMap(sql.toString(), this.get("aac201"));
    	String likeNumber=likeNumber();
    	abc.put("aad101", likeNumber);
    	String collectionNumber=collectionNumber();
    	abc.put("aad201", collectionNumber);
    	return abc;
    }
    
    /*
     * �ϴ���Ʒinsert into ac02(aab101,aac202,aac203,aac204,aac207,aac205,aac206)
     * values('1',NOW(),'������������������','img/san.jpg','1', '0','0')
     */
    private boolean addPro()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aab101,aac202,aac203,aac204,aac207,")
    			.append("                 aac205,aac206)")
    			.append("          values(?,NOW(),?,?,?,")
    			.append("                 '0','0')")
    			;
    	//2.��д��������
    	Object args[]={
    			aab101,
    			this.get("aac203"),
    			this.get("aac204"),
    			this.get("aac207")
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    }
    
    //�ж��Ƿ����
    private String likeNumber()throws Exception
    { 
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	
    	List<Map<String,String>> rows = new ArrayList<>();
    	
    	String sql="select aad101 from ad01 where aad103='02' and aad104=? and aab101=? ";
    	
    	Object args[]={this.get("aac201"),aab101};
    	
    	String value = null;
    	rows = this.queryForList(sql, args);
        for (Map<String, String> m :rows)
        {
            for(Map.Entry<String, String> vo : m.entrySet()){
                vo.getKey();
                value=vo.getValue();
            }
        }    	
		return value;
    }
    //�ж��Ƿ��ղ�
    private String collectionNumber()throws Exception
    { 
    	//��ȡ��ǰԱ�����
    	//String aab101="1";
    	//��DTO���Ա�����
    	//this.put("aab101", aab101);
    	
    	List<Map<String,String>> rows = new ArrayList<>();
    	
    	String sql="select aad201 from ad02 where aad203='02' and aad301='1' and aad204=?";
    	
    	Object args[]={this.get("aac201")};
    	
    	String value = null;
    	rows = this.queryForList(sql, args);
        for (Map<String, String> m :rows)
        {
            for(Map.Entry<String, String> vo : m.entrySet()){
                vo.getKey();
                value=vo.getValue();
            }
        }    	
		return value;
    }
    
    /*
     * ������Ʒ
     * 1������ޱ������ӵ�������
     * insert into ad01(aab101,aad102,aad103,aad104)
       values('1',NOW(),'02','1')
     * 2��������Ʒ����ĵ�����
     * UPDATE ac02 a
       set a.aac205=a.aac205+1
       WHERE a.aac201=1
     */
    private boolean giveLike()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad01(aab101,aad102,aad103,aad104)")
    			.append("          values(?,NOW(),'02',?)")
    			;
    	Object args1[]={
    			aab101,
    			this.get("aac201")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac206=a.aac206+1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    
    //ȡ������
    private boolean cancleLike()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	
    	String sql1="delete from ad01 where aad103='02' and aab101=? and aad104=? ";
    	
    	Object args1[]={aab101,this.get("aac201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac206=a.aac206-1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
   
    //������Ʒ
    private boolean addComment()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	    	
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ad04(aad402,aad403,aad404,aad405)")
    			.append("          values('02',?,?,?)")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aac201"),
    			this.get("aad404"),
    			aab101   			
    	};
        return this.executeUpdate(sql.toString(), args)>0;	
    } 
    
    //չʾ����
    public List<Map<String,String>> queryComment()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad404,b.aab102,b.aab106")
    			.append("  from ad04 a, ab01 b")
    			.append(" where a.aad405=b.aab101")
    			.append("   and a.aad402='02' ")
    			.append("   and a.aad403=? ")
    			;
    	Object args[]={
    			this.get("aac201")   			  			
    	};
    	return this.queryForList(sql.toString(),args);
    }
    
    //չʾ����
    public List<Map<String,String>> queryLike()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aab102,b.aab106")
    			.append("  from ad01 a, ab01 b")
    			.append(" where a.aad103='02' ")
    			.append("   and a.aad104=? ")
    			;
    	Object args[]={
    			this.get("aac201")   			  			
    	};
    	return this.queryForList(sql.toString(),args);
    }
    
    // �ղ���Ʒ
    private boolean collection()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad301,aad202,aad203,aad204)")
    			.append("          values('1',NOW(),'02',?)")
    			;
    	Object args1[]={
    			this.get("aac201")
    	};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac205=a.aac205+1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    
    //ȡ���ղ�
    private boolean cancleCollection()throws Exception
    {
    	//��ȡ��ǰԱ�����
    	String aab101="1";
    	//��DTO���Ա�����
    	this.put("aab101", aab101);
    	
    	String sql1="delete from ad02 where aad203='02' and aad301='1' and aad204=? ";
    	
    	Object args1[]={aab101,this.get("aac201")};
    	this.apppendSql(sql1.toString(), args1);
    	
    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac205=a.aac205-1")
    			.append(" where a.aac201=?")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);
    	
    	return this.executeTransaction();
    }
    
}
