
public class EmpServicesImpl implements BaseServices
{
   
   @ProjectMetaData(methodMemo="���Ա��")	
   private void addEmp()
   {
	   System.out.println(" add  emp......");
   }
   
   @ProjectMetaData(methodMemo="������ɾ������")
   boolean deleteById()
   {
	   System.out.println(" deleteById  emp......");
	   return false;
   }
   
   @ProjectMetaData(methodMemo="��ʾ����")
   protected final void  show()
   {
	   System.out.println(" show  emp......");
   }
   
   public void print()
   {
	   System.out.println(" print  emp......");
   }
}
