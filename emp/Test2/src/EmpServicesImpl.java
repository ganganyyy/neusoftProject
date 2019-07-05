
public class EmpServicesImpl implements BaseServices
{
   
   @ProjectMetaData(methodMemo="添加员工")	
   private void addEmp()
   {
	   System.out.println(" add  emp......");
   }
   
   @ProjectMetaData(methodMemo="按主键删除数据")
   boolean deleteById()
   {
	   System.out.println(" deleteById  emp......");
	   return false;
   }
   
   @ProjectMetaData(methodMemo="显示数据")
   protected final void  show()
   {
	   System.out.println(" show  emp......");
   }
   
   public void print()
   {
	   System.out.println(" print  emp......");
   }
}
