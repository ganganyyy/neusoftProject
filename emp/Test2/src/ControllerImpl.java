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
		//1.获取类的描述对象
	    Class servicesClass=services.getClass();
	    //2.获取该类的方法清单
	    Method methodList[]= servicesClass.getDeclaredMethods();
	    //3.循环读取每个方法
	    for(Method method: methodList)
	    {
	    	//获取方法的元数据注解
	    	ProjectMetaData anno=method.getAnnotation(ProjectMetaData.class);
	    	//规避NPE
	    	if(anno!=null)
	    	{
	    		System.out.println(method.getName()+" : "+anno.methodMemo());
	    	}
	    }
	}
	
	
	public static void execute(BaseServices services)throws Exception
	{
	     	//1.获取类的描述对象
		    Class servicesClass=services.getClass();
		    //2.获取该类的方法清单
		    Method methodList[]= servicesClass.getDeclaredMethods();
		    for(Method  method:methodList)
		    {
		    	//获取方法的修饰词信息
		    	int mod=method.getModifiers();
		    	//判断该方法是否是私有
		    	if(Modifier.isPrivate(mod))
		    	{
		    		method.setAccessible(true);
		    		method.invoke(services);
		    	}
		    }
		    
//		    //获取某一个指定的方法
//		    Method method= servicesClass.getDeclaredMethod("addEmp");
//		    //取消java的检查机制
//		    method.setAccessible(true);
//		    //调用该方法
//		    method.invoke(services);
		    
		    
		    
	}

}
