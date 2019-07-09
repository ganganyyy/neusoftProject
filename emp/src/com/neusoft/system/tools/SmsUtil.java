package com.neusoft.system.tools;


import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

import java.util.ResourceBundle;

public class SmsUtil {

	public SmsUtil() {
		// TODO Auto-generated constructor stub
	}

	static final String product="Dysmsapi";//����API��Ʒ����
    static final String domain="dysmsapi.aliyuncs.com";//����API��Ʒ����
    static String accessKeyId=null;
    static String accessKeySecret=null;
    static
	{
		//��ȡ��Դ�ļ�����������
		ResourceBundle bundle=ResourceBundle.getBundle("DBOptions");
		//ͨ����������,��ȡ����
		accessKeyId=bundle.getString("accessKeyId");
		accessKeySecret=bundle.getString("accessKeySecret");	
	}
    
    
    public static SendSmsResponse sendSms(String tel,String templateCode,String signName,
                                   String templateParam)throws ClientException{

        //���ó�ʱʱ��
        System.getProperty("sun.net.client.defaultConnectTimeout","10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        //��ʼ��ascClient,�ݲ�֧��region��
        IClientProfile profile= DefaultProfile.getProfile("cn-hangzhou",accessKeyId,accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou","cn-hangzhou",product,domain);
        IAcsClient acsClient=new DefaultAcsClient(profile);

        //��װ�������
        SendSmsRequest request=new SendSmsRequest();
        //�����ֻ���
        request.setPhoneNumbers(tel);
        //����ǩ��
        request.setSignName(signName);
        //����ģ��
        request.setTemplateCode(templateCode);
        //����
        request.setTemplateParam(templateParam);

        //���ж�����չ��(�����������û��ɺ��Դ��ֶ�)
        //request.setSmsUpExtendCode("90997");
        //��ѡ:outIdΪ�ṩ��ҵ����չ�ֶ�,�����ڶ��Ż�ִ��Ϣ�н���ֵ���ظ�������
        request.setOutId("outterReminder");

        //�˴������׳��쳣
        SendSmsResponse sendSmsResponse=acsClient.getAcsResponse(request);
        return sendSmsResponse;

    }
}
