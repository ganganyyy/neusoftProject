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

	static final String product="Dysmsapi";//短信API产品名称
    static final String domain="dysmsapi.aliyuncs.com";//短信API产品域名
    static String accessKeyId=null;
    static String accessKeySecret=null;
    static
	{
		//获取资源文件解析器对象
		ResourceBundle bundle=ResourceBundle.getBundle("DBOptions");
		//通过解析对象,获取数据
		accessKeyId=bundle.getString("accessKeyId");
		accessKeySecret=bundle.getString("accessKeySecret");	
	}
    
    
    public static SendSmsResponse sendSms(String tel,String templateCode,String signName,
                                   String templateParam)throws ClientException{

        //设置超时时间
        System.getProperty("sun.net.client.defaultConnectTimeout","10000");
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");
        //初始化ascClient,暂不支持region化
        IClientProfile profile= DefaultProfile.getProfile("cn-hangzhou",accessKeyId,accessKeySecret);
        DefaultProfile.addEndpoint("cn-hangzhou","cn-hangzhou",product,domain);
        IAcsClient acsClient=new DefaultAcsClient(profile);

        //组装请求对象
        SendSmsRequest request=new SendSmsRequest();
        //待发手机号
        request.setPhoneNumbers(tel);
        //短信签名
        request.setSignName(signName);
        //短信模板
        request.setTemplateCode(templateCode);
        //变量
        request.setTemplateParam(templateParam);

        //上行短信扩展码(无特殊需求用户可忽略此字段)
        //request.setSmsUpExtendCode("90997");
        //可选:outId为提供给业务方扩展字段,最终在短信回执消息中将此值带回给调用者
        request.setOutId("outterReminder");

        //此处可能抛出异常
        SendSmsResponse sendSmsResponse=acsClient.getAcsResponse(request);
        return sendSmsResponse;

    }
}
