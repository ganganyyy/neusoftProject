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
 * 主要为登录注册模块使用
 * 操作Ab01用户表
 * @author gangna
 *
 */
public class Ab01ServicesImpl extends JdbcServicesSupport {

	
	/**
	 * 登录
	 * 根据手机号码、密码验证用户
	 */
	  public Map<String,String> findById()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
	    			.append("       a.aab106")
	    			.append("  from ab01 a")
	    			.append(" where a.aab103=? and a.aab104=?")
	    			;
	    	
	    	//执行查询
	    	return this.queryForMap(sql.toString(), this.get("aab103"),this.get("aab104"));
	    }
	  
	  /**
	   * 根据手机号查询用户
	   * @param aab104
	   * @return
	   * @throws Exception
	   */
	  public Map<String,String> findByTel()throws Exception
	    {
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("select a.aab101,a.aab102,a.aab103,a.aab104,a.aab105,")
	    			.append("       a.aab106")
	    			.append("  from ab01 a")
	    			.append(" where a.aab104=?")
	    			;
	    	
	    	//执行查询
	    	return this.queryForMap(sql.toString(),this.get("aab104"));
	    }
	  
	  
	  /**
	   * 将用户增加到数据库(注册)
	   * @return
	   * @throws Exception
	   */
	    public boolean addAb01()throws Exception
	    {
	    	String uuid=UUID.randomUUID().toString().replace("-", "").toLowerCase();
	    	//1.编写SQL语句
	    	StringBuilder sql=new StringBuilder()
	    			.append("insert into ab01(aab102,aab103,aab104,aab105,aab106,")
	    			.append("				  aab107,aab108)")
	    			.append("				  values(?,?,?,'01','默认图片地址',0,0);");
	    	//2.编写参数数组
	    	Object args[]={
	    			uuid,
	    			this.get("aab103"),
	    			this.get("aab104"),
	    	};
	        return this.executeUpdate(sql.toString(), args)>0;	
	    }
	    
	   
	    /**
	     * 人气用户
	     * 根据被关注人数搜索前10名用户
	     * aab108:被关注人数
	     * ac01Count:总食谱数
	     * ac02Count：总作品数
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
	   * 短信服务
	   * @return
	   */
		protected Map<String,String> getVerify()
		{
			String aab104=(String) this.get("aab104");
			 //2.模板参数
	        String signName = "作业宝";
	        String templateCode = "SMS_165117602";
	        String randCode=randCode(5);
	        String verifyCode=randCode;
	        String param="{\"code\":\""+randCode+"\"}";
	        //3.发送短信
	        try {
	            SendSmsResponse sendSmsResponse = SmsUtil.sendSms(aab104, templateCode, signName, param);
	            if (sendSmsResponse.getCode().equals("OK")) {
	                Map<String,String>data=new HashMap<>();
	                data.put("verifyCode",randCode);
	                data.put("aab104",aab104);
	                return data;
	            } else {
	            	System.out.println("短信发送失败"+sendSmsResponse);
	                return null;
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            System.out.println("短信请求失败抛出异常");
	            return null;
	        }
		}
		
		/**
		 * 生成随机验证码
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
