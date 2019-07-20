package com.neusoft.services.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.Tools;
/**
 * ��Ʒ��ز���
 * @author ������
 */
public class Ac02ServicesImpl extends JdbcServicesSupport
{

	/**
     * ɺɺͷ��
     * @return
     * @throws Exception
     */
    public Map<String,String> findByIdForPhoto()throws Exception
	{
		String sql = "select aab102,aab106,aab107,aab108 from ab01 where aab101=?";
		return this.queryForMap(sql,this.get("aab101"));
	}

	   //��ȡ�ղؼ�ͼƬ
	public String getImg()
	{
		Random ran = new Random();
	    int i = ran.nextInt(5);
	    switch(i)
	    {
	         case 1:
	            return "img/collection/01.jpeg";
			 case 2:
				return "img/collection/02.jpg";
			 case 3:
				return "img/collection/03.jpg";
			 case 4:
			    return "img/collection/04.jpg";
			 case 5:
			    return "img/collection/05.jpeg";
			 default:
				return "img/collection/06.jpg";
	    }
	}

	//��ѯ������Ʒ
    public List<Map<String,String>> query()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select aac201,aab101,aac202,aac203,aac204,")
    			.append("       aac207,aac205,aac206 ")
    			.append("  from ac02 ")
    			;
    	//ִ�в�ѯ
    	return this.queryForList(sql.toString());
    }


    //��ѯĳһ��Ʒ����
    public Map<String,String> findById()throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aac201,a.aab101,a.aac202,a.aac203,a.aac204,")
    			.append("       a.aac207,c.aac102,b.aab101,b.aab102,b.aab106")
    			.append("  from ac02 a, ab01 b, ac01 c")
    			.append(" where a.aac207=c.aac101")
    			.append("   and a.aab101=b.aab101")
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
    //��ѯ�ղؼ�
	public List<Map<String,String>> queryCollections()throws Exception
	{
		 StringBuilder sql=new StringBuilder()
	    		.append("select a.aad301,a.aad302,a.aad303")
	    		.append("  from ad03 a")
	    		.append(" where a.aab101=?")
	    		;
	     return this.queryForList(sql.toString(), this.get("aab101Self"));
	 }


    /*
     * �ϴ���Ʒinsert into ac02(aab101,aac202,aac203,aac204,aac207,aac205,aac206)
     * values('1',NOW(),'������������������','img/san.jpg','1', '0','0')
     */
    public boolean addPro(Map<String,Object> dto)throws Exception
    {
    	//1.��дSQL���
    	StringBuilder sql=new StringBuilder()
    			.append("insert into ac02(aab101,aac202,aac203,aac204,aac207,")
    			.append("                 aac205,aac206)")
    			.append("          values(?,NOW(),?,?,?,")
    			.append("                 '0','0')")
    			;
    	//2.��д��������
    	Object args[]={
    			this.get("aab101Self"),
    			dto.get("aac203"),
    			dto.get("aac204"),
    			dto.get("aac207")
    	};
        return this.executeUpdate(sql.toString(), args)>0;
    }

    //�ж��Ƿ��ղ�
    private String collectionNumber()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
		    		.append("select aad201 from ad02 a left join ad03 b")
		    		.append("  on a.aad301=b.aad301")
		    		.append(" where a.aad203='02'")
		    		.append("   and a.aad204=?")
		    		.append("   and b.aab101=?")
		    		;
    	Object args[]={this.get("aac201"),this.get("aab101Self")};
    	return check(sql.toString(),args);
    }
    //�ж��Ƿ����
    private String likeNumber()throws Exception
    {
    	String sql="select aad101 from ad01 where aad103='02' and aad104=? and aab101=? ";
    	Object args[]={this.get("aac201"),this.get("aab101Self")};
    	return check(sql,args);
    }
    //�����Ʒ���û���ˮ��
    private String authorNumber()throws Exception
    {
    	String sql="select aab101 from ac02 where aac201=? ";
    	Object args[]={this.get("aac201")};
    	return check(sql,args);
    }
    //��õ�ǰ�û����û���
    private String userName()throws Exception
    {
    	String sql="select aab102 from ab01 where aab101=? ";
    	Object args[]={this.get("aab101Self")};
    	return check(sql,args);
    }

    /**
     * ִ�в�ѯ��ֵ���
     * @param sql
     * @param args
     * @return ��ѯ�õ���Ψһ��ֵ
     * @throws Exception
     */
    private String check(String sql,Object args[])throws Exception
    {
    	List<Map<String,String>> rows = new ArrayList<>();
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

    private Object[] xiaoxi(String msg)throws Exception
    {
    	//��ǰ��Ʒ���û���
    	String authorNumber = authorNumber();
    	//��ǰ�û�������
    	String userName=userName();
    	String text=userName+msg;
    	Object args[]={authorNumber,text};
    	return args;
    }

    /*
     * ������Ʒ
     * 1������ޱ������ӵ�������
     * 2��������Ʒ����ĵ�����
     * 3������Ϣ�б���������
     */
    private boolean giveLike()throws Exception
    {
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad01(aab101,aad102,aad103,aad104)")
    			.append("          values(?,NOW(),'02',?)")
    			;
    	Object args1[]={
    			this.get("aab101Self"),
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

    	StringBuilder sql3=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args3[]=xiaoxi("�������Ʒ������");
    	this.apppendSql(sql3.toString(), args3);

    	return this.executeTransaction();
    }

    //ȡ����Ʒ����
    private boolean cancleProLike()throws Exception
    {
    	String sql1="delete from ad01 where aad103='02' and aab101=? and aad104=? ";

    	Object args1[]={this.get("aab101Self"),this.get("aac201")};
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
    	//1.��дSQL���
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad04(aad402,aad403,aad404,aad405)")
    			.append("          values('02',?,?,?)")
    			;
    	//2.��д��������
    	Object args1[]={
    			this.get("aac201"),
    			this.get("aad404"),
    			this.get("aab101Self")
    	};
    	this.apppendSql(sql1.toString(), args1);

    	StringBuilder sql2=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args2[]=xiaoxi("�����������Ʒ");
    	this.apppendSql(sql2.toString(), args2);

    	return this.executeTransaction();
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
    public List<Map<String,String>> queryLikes()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select b.aab102,b.aab106")
    			.append("  from ad01 a, ab01 b")
    			.append(" where a.aab101=b.aab101")
    			.append("   and a.aad103='02' ")
    			.append("   and a.aad104=? ")
    			;
    	Object args[]={
    			this.get("aac201")
    	};
    	return this.queryForList(sql.toString(),args);
    }

    //�ղ���Ʒ
    private boolean collection()throws Exception
    {
    	StringBuilder sql1=new StringBuilder()
    			.append("insert into ad02(aad301,aad202,aad203,aad204)")
    			.append("          values(?,NOW(),'02',?)")
    			;
    	Object args1[]={
    			this.get("aad301"),
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

    	StringBuilder sql3=new StringBuilder()
    			.append("insert into ab03(aab101,aab302,aab303,aab304)")
    			.append("          values(?,?,'00',NOW())")
    			;
    	Object args3[]=xiaoxi("�ղ��������Ʒ");
    	this.apppendSql(sql3.toString(), args3);

    	return this.executeTransaction();
    }

	//��ȡ�ղؼ�ͼƬ
	public String getImg()
	{
		Random ran = new Random();
	    int i = ran.nextInt(5);
	    switch(i)
	    {
	         case 1:
	            return "img/collection/01.jpeg";
			 case 2:
				return "img/collection/02.jpg";
			 case 3:
				return "img/collection/03.jpg";
			 case 4:
			    return "img/collection/04.jpg";
			 case 5:
			    return "img/collection/05.jpeg";
			 default:
				return "img/collection/06.jpg";
	    }
	}

    //�����������ղؼ�
	public boolean createColl()throws Exception
	{
		 StringBuilder sql=new StringBuilder()
	    			.append("insert into ad03(aab101,aad302,aad303)")
	    			.append("       values(?,?,?) ")
	    			;
		 Object args[]={this.get("aab101Self"),this.get("caad302"),getImg()};
		 this.apppendSql(sql.toString(), args);

		 int aad301=Tools.getSequence("aad301");

	     StringBuilder sql1=new StringBuilder()
	    			.append("insert into ad02(aad301,aad202,aad203,aad204)")
	    			.append("       values(?,NOW(),'02',?)")
	    			;
	     Object args1[]={aad301,this.get("aac201")};
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
    	String sql1="delete from ad02 where aad201=? ";

    	Object args1[]={this.get("aad201")};
    	this.apppendSql(sql1, args1);

    	StringBuilder sql2=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac205=a.aac205-1")
    			.append(" where a.aac201=? ")
    			;
    	Object args2[]={this.get("aac201")};
    	this.apppendSql(sql2.toString(), args2);

    	return this.executeTransaction();
    }

    //ɾ����Ʒ
    private boolean deleteById()throws Exception
    {
    	String sql="delete from ac02 where aac201=?";
    	return this.executeUpdate(sql, this.get("aac201"))>0;
    }

    //�޸���Ʒ
    public boolean modifyPro(Map<String,Object> dto)throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("update ac02 a")
    			.append("   set a.aac202=NOW(),a.aac203=?,a.aac204=?")
    			.append(" where a.aac201=?")
    			;
    	Object args[]={
    			dto.get("aac203"),
    			dto.get("aac204"),
    			dto.get("aac201")
    	};
    	return this.executeUpdate(sql.toString(), args)>0;
    }

    //��ѯ�ҵ��޵Ĳ���
    private List<Map<String,String>> myReciLikes()throws Exception
    {


    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad101,b.aac102,b.aac108,b.aac101")
    			.append("  from ad01 a, ac01 b ")
    			.append(" where a.aad104=b.aac101 ")
    			.append("   and a.aad103='01' ")
    			.append("   and a.aab101=?")
    			;

    	return this.queryForList(sql.toString(),this.get("aab101"));
    }
    //��ѯ�ҵ��޵���Ʒ
    private List<Map<String,String>> myProLikes()throws Exception
    {

    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad101,b.aac204,b.aac203,b.aac201")
    			.append("  from ad01 a, ac02 b ")
    			.append(" where a.aad104=b.aac201 ")
    			.append("   and a.aad103='02' ")
    			.append("   and a.aab101=?")
    			;

    	return this.queryForList(sql.toString(),this.get("aab101"));
    }
    //��ѯ�ҵ��޵�ר��
    private List<Map<String,String>> myCompLikes()throws Exception
    {
    	StringBuilder sql=new StringBuilder()
    			.append("select a.aad101,b.aac302,b.aac301")
    			.append("  from ad01 a, ac03 b ")
    			.append(" where a.aad104=b.aac301 ")
    			.append("   and a.aad103='03' ")
    			.append("   and a.aab101=?")
    			;

    	return this.queryForList(sql.toString(),this.get("aab101"));
    }

    //ɾ������
    private boolean deleteLikes()throws Exception
    {
    	String tag=(String)this.get("aad103");
    	if(tag.equals("01"))
    	{
    		return cancleReciLike();
    	}
    	if(tag.equals("02"))
    	{
    		return cancleProLike();
    	}
    	else
    	{
    		return cancleCompLike();
    	}
    }
}
