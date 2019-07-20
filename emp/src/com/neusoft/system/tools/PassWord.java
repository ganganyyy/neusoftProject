package com.neusoft.system.tools;

import java.security.MessageDigest;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;

import com.neusoft.system.db.DBUtils;

public class PassWord 
{

	
	public static  String conduct(Object object)throws Exception
	{
	
			/**
			 * MD5���λ�������
			 */
			//�õ�����
			//���ԭʼ����
			String md5pwd1=PassWord.MD5Encode(object);
			//���ɻ�������
			String pwd2=md5pwd1+"�����ե㥥�����ɦ������ը㡦��������:�ԟo�ˤϤ�����èبר�Ŧؤ������з�,�ԟo��Ƨާ�٧��ޞ�����"+md5pwd1;
			String result=PassWord.MD5Encode(pwd2);
			System.out.println(result);
			return result;
			
			
			/**
			 * MD5�ļ�������
			 * 1.ͬһ����,���ܺ��������Զ��ͬ
			 * 2.�������Ķ೤,���ĵĳ��ȶ���32λ
			 * 3.MD5������:�����Դ������ٻ�ԭ������
			 */
		
	}
	
	private PassWord() {}

	
	/***************************************************************************
	 *                    MD5Begin
	 ***************************************************************************/
	
	
	   public static String getMd5(Object pwd)throws Exception
	   {
			/**
			 * MD5���λ�������
			 */
			//���ԭʼ����
			String md5pwd1=PassWord.MD5Encode(pwd);
			//���ɻ�������
			String pwd2=md5pwd1+"�����ե㥥�����ɦ������ը㡦��������:�ԟo�ˤϤ�����èبר�Ŧؤ������з�,�ԟo��Ƨާ�٧��ޞ�����"+md5pwd1;
			String md5pwd2=PassWord.MD5Encode(pwd2);
			return md5pwd2;

	   }
	
	   
	    private final static String[] hexDigits = {
		     "0", "1", "2", "3", "4", "5", "6", "7",
		     "8", "9", "a", "b", "c", "d", "e", "f"
		     };

		  /**
		   * ת���ֽ�����Ϊ16�����ִ�
		   * @param b �ֽ�����
		   * @return 16�����ִ�
		   */
		  private static String byteArrayToHexString(byte[] b)
		  {
		      StringBuffer resultSb = new StringBuffer();
		      for (int i = 0; i < b.length; i++)
		      {
		         resultSb.append(byteToHexString(b[i]));
		      }
		      return resultSb.toString();
		  }
		  /**
		   * ת���ֽ�Ϊ16�����ַ���
		   * @param b byte
		   * @return String
		   */
		  private static String byteToHexString(byte b)
		  {
		      int n = b;
		      if (n < 0)
		         n = 256 + n;
		      int d1 = n / 16;
		      int d2 = n % 16;
		      return hexDigits[d1] + hexDigits[d2];
		  }
		  /**
		   * �õ�MD5����������
		   * @param origin String
		   * @throws Exception
		   * @return String
		   */
		  private static String MD5Encode(Object origin) throws Exception
		  {
		       String resultString = null;
		       try
		       {
		           resultString=new String(origin.toString());
		           MessageDigest md = MessageDigest.getInstance("MD5");
		           resultString=byteArrayToHexString(md.digest(resultString.getBytes()));
		           return resultString;
		       }
		       catch (Exception ex)
		       {
		          throw ex;
		       }
		  }	
	/***************************************************************************
	 *                    MD5End
	 ***************************************************************************/

	
	/**
	 * ��ȡԱ����ˮ��
	 * @return  String number="yyyy"+4λ��ˮ��
	 * @throws Exception
	 */
	public static String getEmpNumber()throws Exception
	{
		return PassWord.getCurrentYear()+PassWord.getFormatNumber("E");
	}
	
	private static final String baseCode1="0000";
	
	/**
	 * ��ȡ��ʽ����β��
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static String getFormatNumber(String firstName)throws Exception
	{
		//1.��ȡ��ˮ��
		int lastNumber=PassWord.getNumnberForYear(firstName);
		//2.������ˮ�ŵĿ��
		int size=String.valueOf(lastNumber).length();
		
		return baseCode1.substring(size)+lastNumber;
		
	}
	
	/**
	 * ��ȡԱ����ŵ�β��
	 * @param firstName
	 * @return
	 * @throws Exception
	 */
	private static int getNumnberForYear(String firstName)throws Exception
	{
		PreparedStatement pstm1=null;
		PreparedStatement pstm2=null;
		ResultSet rs=null;
		try
		{
			//1.����SQL����ѯ��ǰֵ
			StringBuilder sql1=new StringBuilder()
					.append("select a.pkvalue ")
					.append("  from sequence a ")
					.append("  where date_format(a.sdate,'%Y')=date_format(current_date,'%Y')")
					.append("    and a.pkname=?")
					;
			pstm1=DBUtils.prepareStatement(sql1.toString());
			pstm1.setObject(1, firstName);
			rs=pstm1.executeQuery();
			
			int currentVal=0;
			StringBuilder sql2=new StringBuilder();
			if(rs.next())
			{
				currentVal=rs.getInt(1);
				sql2.append("update sequence ")
				    .append("   set pkvalue=?")
				    .append(" where date_format(sdate,'%Y')=date_format(current_date,'%Y')")
				    .append("   and pkname=?")
				;
			}
			else
			{
				sql2.append("insert into sequence(pkvalue,pkname,sdate)")
				    .append("              values(?,?,current_date)")
				;
			}
			pstm2=DBUtils.prepareStatement(sql2.toString());
			pstm2.setObject(1, ++currentVal);
			pstm2.setObject(2, firstName);
			pstm2.executeUpdate();
			
			return currentVal;
		}
		finally
		{
			DBUtils.close(rs);
			DBUtils.close(pstm1);
			DBUtils.close(pstm2);
		}
		
		
	}
	
	/**
	 * ��ȡ����
	 * @return
	 */
	private static String  getCurrentYear()
	{
//		//ʵ�������ڸ�ʽ��
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy");
//		//��ȡϵͳ��ǰ����
//		Date d=new Date();
//		//��ʽ����ǰ����
//		String str_date=sdf.format(d);
//		return str_date;
		
		
		return new SimpleDateFormat("yyyy").format(new java.util.Date());
	}
	
			
	/**
	 * ���������ӳ��ַ���
	 * @param element
	 * @return
	 */
	public static String joinArray(Object element)
	{
		//��ֵ����
		if(element==null || element.equals(""))
		{
			return "";
		}
		
		//�ж�element������ʲô?���ַ��������ַ�������
		if(element instanceof java.lang.String[])
		{
			//������ת�����ַ�������
			String arr[]=(String[])element;
			//�������鳤��
			int len=arr.length;
			//���춯̬�ַ�������,װ�������ÿ��Ԫ��
			StringBuilder tem=new StringBuilder(arr[0]);
			//ѭ����ȡ����ĺ��Ԫ��
			for(int i=1;i<len;i++)
			{
				tem.append(",").append(arr[i]);
			}
			return tem.toString();
		}
		else
		{
			return element.toString();
		}	
		
	}
	
	
	 /**
	  * ��ȡ����ֵ 
	  * @param pkname
	  * @return
	  * @throws Exception
	  */
    public static int getSequence(String pkname)throws Exception
    {
   	 PreparedStatement pstm1=null;    //��ѯ���еĵ�ǰֵ
   	 PreparedStatement pstm2=null;    //�޸����еĵ�ǰֵ
   	 ResultSet rs=null;
   	 try
   	 {
   		 //����SQL���,��ѯ���еĵ�ǰֵ
   		 String sql1="select a.pkvalue from sequence a where a.pkname=?";
   		 //����SQL1
   		 pstm1=DBUtils.prepareStatement(sql1);
   		 //������ֵ
   		 pstm1.setObject(1, pkname);
   		 //ִ�в�ѯ
   		 rs=pstm1.executeQuery();
   		 
   		 //�������е�ǰֵ
   		 int currentVal=0;
   		 //�ж����ݿ���,�Ƿ���ڵ�ǰ�е�ֵ
   		 if(rs.next())
   		 {
   			 //��ȡ���ݿ⵱ǰֵ,Ϊ���и�ֵ
   			 currentVal=rs.getInt(1);
   			 
   			 //�޸������е�ֵ,��ԭ��������+1
   			 String sql2="update sequence set pkvalue=? where pkname=?";
   			 pstm2=DBUtils.prepareStatement(sql2);
   			 pstm2.setObject(1, ++currentVal);
   			 pstm2.setObject(2, pkname);
   			 pstm2.executeUpdate();
   			 
   		 }
   		 else
   		 {
   			 //�����ݿ�¼�뵱ǰ����������,pkvalueֵΪ1
   			 String sql2="insert into sequence(pkname,pkvalue) values(?,?)";
   			 pstm2=DBUtils.prepareStatement(sql2);
   			 pstm2.setObject(1, pkname);
   			 pstm2.setObject(2, ++currentVal);
   			 pstm2.executeUpdate();
   		 }	 
   		 
   		 return currentVal;
   		 
   	 }
   	 finally
   	 {
   		 DBUtils.close(rs);
   		 DBUtils.close(pstm1);
   		 DBUtils.close(pstm2);
   	 }
    }

}
