package com.neusoft.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.UUID;


import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.neusoft.services.JdbcServicesSupport;
import com.neusoft.system.tools.PassWord;
import com.neusoft.system.tools.SmsUtil;
import com.neusoft.system.tools.Tools;


/**
 * 
 * 锟斤拷要为锟斤拷录注锟斤拷模锟斤拷使锟斤拷
 * 锟斤拷锟斤拷Ab01锟矫伙拷锟斤拷
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
	 * 锟斤拷录
	 * 锟斤拷锟斤拷锟街伙拷锟斤拷锟诫、锟斤拷锟斤拷锟斤拷证锟矫伙拷
	 */
	  public Map<String,String> findById()throws Exception
	    {
	    	//1.锟斤拷写SQL锟斤拷锟�
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
	    			.append("       a.aab106")
	    			.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	
	    	//执锟叫诧拷询
	    	return this.queryForMap(sql.toString(), PassWord.conduct(this.get("aab103")),this.get("aab104"));
	    }
	  
	  /**
	   * 锟斤拷锟斤拷锟街伙拷锟脚诧拷询锟矫伙拷
	   * @param aab104
	   * @return
	   * @throws Exception
	   */
	  public Map<String,String> findByTel()throws Exception
	    {
	    	//1.锟斤拷写SQL锟斤拷锟�
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
	    			.append("       a.aab106")
	    			.append("  from ab01 a")
	    			.append(" where a.aab104=?")
	    			;
	    	
	    	//执锟叫诧拷询
	    	return this.queryForMap(sql.toString(),this.get("aab104"));
	    }
	  
	  
	  /**
	   * 锟斤拷锟矫伙拷锟斤拷锟接碉拷锟斤拷锟捷匡拷(注锟斤拷)
	   * @return
	   * @throws Exception
	   */
	    public boolean addAb01()throws Exception
	    {
	    	String uuid=UUID.randomUUID().toString().replace("-", "").toLowerCase();
	    	//1.锟斤拷写SQL锟斤拷锟�
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
	    			.append("				  aab107,aab108)")
	    			.append("				  values(?,?,?,'01','',0,0);");
	    	//2.锟斤拷写锟斤拷锟斤拷锟斤拷锟斤拷
	    	Object args[]={
	    			uuid,
	    			PassWord.conduct(this.get("aab103")),
	    			this.get("aab104"),
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
	    
	   
	    /**
	     * 锟斤拷锟斤拷锟矫伙拷
	     * 锟斤拷锟捷憋拷锟斤拷注锟斤拷锟斤拷锟斤拷锟斤拷前10锟斤拷锟矫伙拷
	     * aab108:锟斤拷锟斤拷注锟斤拷锟斤拷
	     * ac01Count:锟斤拷食锟斤拷锟斤拷
	     * ac02Count锟斤拷锟斤拷锟斤拷品锟斤拷
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
	   * 锟斤拷锟脚凤拷锟斤拷
	   * @return
	   */
		protected Map<String,String> getVerify()
		{
			String aab104=(String) this.get("aab104");
			 //2.模锟斤拷锟斤拷锟�
	        String signName = "作业宝";
	        String templateCode = "SMS_165117602";
	        String randCode=randCode(5);
	        String verifyCode=randCode;
	        String param="{\"code\":\""+randCode+"\"}";
	        //3.锟斤拷锟酵讹拷锟斤拷
	        try {
	            SendSmsResponse sendSmsResponse = SmsUtil.sendSms(aab104, templateCode, signName, param);
	            if (sendSmsResponse.getCode().equals("OK")) {
	                Map<String,String>data=new HashMap<>();
	                data.put("verifyCode",randCode);
	                data.put("aab104",aab104);
	                return data;
	            } else {
	            	System.out.println(sendSmsResponse.getMessage());
	                return null;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("锟斤拷锟斤拷锟斤拷锟斤拷失锟斤拷锟阶筹拷锟届常");
	            return null;
	        }
		}
		
		/**
		 * 锟斤拷锟斤拷锟斤拷锟斤拷锟街わ拷锟�
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
