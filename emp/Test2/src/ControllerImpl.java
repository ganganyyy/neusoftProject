import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

public class ControllerImpl {

	public static void main(String[] args)
	{
		try
		{
			EmpServicesImpl services=new EmpServicesImpl();
			
			ControllerImpl//.execute(services);
			              .showannotation(services);
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}
	
	
	public static void showannotation(BaseServices services)throws Exception
	{
		//1.��ȡ�����������
	    Class servicesClass=services.getClass();
	    //2.��ȡ����ķ����嵥
	    Method methodList[]= servicesClass.getDeclaredMethods();
	    //3.ѭ����ȡÿ������
	    for(Method method: methodList)
	    {
	    	//��ȡ������Ԫ����ע��
	    	ProjectMetaData anno=method.getAnnotation(ProjectMetaData.class);
	    	//���NPE
	    	if(anno!=null)
	    	{
	    		System.out.println(method.getName()+" : "+anno.methodMemo());
	    	}
	    }
	}
	
	
	public static void execute(BaseServices services)throws Exception
	{
	     	//1.��ȡ�����������
		    Class servicesClass=services.getClass();
		    //2.��ȡ����ķ����嵥
		    Method methodList[]= servicesClass.getDeclaredMethods();
		    for(Method  method:methodList)
		    {
		    	//��ȡ���������δ���Ϣ
		    	int mod=method.getModifiers();
		    	//�жϸ÷����Ƿ���˽��
		    	if(Modifier.isPrivate(mod))
		    	{
		    		method.setAccessible(true);
		    		method.invoke(services);
		    	}
		    }
		    
//		    //��ȡĳһ��ָ���ķ���
//		    Method method= servicesClass.getDeclaredMethod("addEmp");
//		    //ȡ��java�ļ�����
//		    method.setAccessible(true);
//		    //���ø÷���
//		    method.invoke(services);
		    
		    
		    
	}

}
