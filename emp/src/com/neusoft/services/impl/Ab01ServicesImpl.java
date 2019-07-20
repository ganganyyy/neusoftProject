package com.neusoft.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;


import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.SmsUtil;
import com.neusoft.system.tools.Tools;


/**
 * 
 * ��ҪΪ��¼ע��ģ��ʹ��
 * ����Ab01�û���
 * @author gangna
 *
 */
public class Ab01ServicesImpl extends JdbcServicesSupport {

	
	
	public Map<String,String>findByAab101()throws Exception
	{
		if(this.get("aab101Self")==null)
		{
			return null;
		}
		StringBuilder sql=new StringBuilder()
				.append("select a.aab101,a.aab102,a.aab105,a.aab106")
    			.append("  from ab01 a")
    			.append(" where a.aab101=?;")
    			;	
		return this.queryForMap(sql.toString(), this.get("aab101Self"));
	}
	
	
	/**
	 * ��¼
	 * �����ֻ����롢������֤�û�
	 */
	  public Map<String,String> findById()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
	    			.append("       a.aab106")
	    			.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(), this.get("aab103"),this.get("aab104"));
	    }
	  
	  /**
	   * �����ֻ��Ų�ѯ�û�
	   * @param aab104
	   * @return
	   * @throws Exception
	   */
	  public Map<String,String> findByTel()throws Exception
	    {
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
	    			.append("       a.aab106")
	    			.append("  from ab01 a")
	    			.append(" where a.aab104=?")
	    			;
	    	
	    	//ִ�в�ѯ
	    	return this.queryForMap(sql.toString(),this.get("aab104"));
	    }
	  
	  
	  /**
	   * ���û����ӵ����ݿ�(ע��)
	   * @return
	   * @throws Exception
	   */
	    public boolean addAb01()throws Exception
	    {
	    	String uuid=UUID.randomUUID().toString().replace("-", "").toLowerCase();
	    	//1.��дSQL���
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
	    			.append("				  aab107,aab108)")
	    			.append("				  values(?,?,?,'01','Ĭ��ͼƬ��ַ',0,0);");
	    	//2.��д��������
	    	Object args[]={
	    			uuid,
	    			this.get("aab103"),
	    			this.get("aab104"),
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
	    
	   
	    /**
	     * �����û�
	     * ���ݱ���ע��������ǰ10���û�
	     * aab108:����ע����
	     * ac01Count:��ʳ����
	     * ac02Count������Ʒ��
	     * @return
	     * @throws Exception
	     */
	    public List<Map<String,String>>queryForPopularUsers()throws Exception
	    {
	    	StringBuilder sql=new StringBuilder()
	    			.append("select u.aab101,aab102,aab106,aab108,count(v.aac106) as ac01Count,")
	    			.append("       count(w.aab101) as ac02Count")
	    			.append("  from ab01 u left join ac01 v on u.aab101=v.aac106")
	    			.append("              left join ac02 w on u.aab101=w.aab101")
	    			.append("  group by u.aab101")
	    			.append("  order by aab108 desc limit 0,10;");
	    			
	    	return this.queryForList(sql.toString());
	    }
	    
	  
	
	  /**
	   * ���ŷ���
	   * @return
	   */
		protected Map<String,String> getVerify()
		{
			String aab104=(String) this.get("aab104");
			 //2.ģ�����
	        String signName = "��ҵ��";
	        String templateCode = "SMS_165117602";
	        String randCode=randCode(5);
	        String verifyCode=randCode;
	        String param="{\"code\":\""+randCode+"\"}";
	        //3.���Ͷ���
	        try {
	            SendSmsResponse sendSmsResponse = SmsUtil.sendSms(aab104, templateCode, signName, param);
	            if (sendSmsResponse.getCode().equals("OK")) {
	                Map<String,String>data=new HashMap<>();
	                data.put("verifyCode",randCode);
	                data.put("aab104",aab104);
	                return data;
	            } else {
	            	System.out.println("���ŷ���ʧ��"+sendSmsResponse);
	                return null;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("��������ʧ���׳��쳣");
	            return null;
	        }
		}
		
		/**
		 * ���������֤��
		 * @param length
		 * @return
		 */
		 private static String randCode(int length){
		        StringBuilder builder=new StringBuilder();
		        Random random=new Random();
		        for(int i=0;i<length;i++){
		            int nextInt=random.nextInt(10);
		            builder.append(String.valueOf(nextInt));
		        }
		        return builder.toString();

		    }
}
