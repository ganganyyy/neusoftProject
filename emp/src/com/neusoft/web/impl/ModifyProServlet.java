package com.neusoft.web.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.neusoft.services.impl.Ac02ServicesImpl;
import com.neusoft.system.tools.Tools;

import basic.FileUtil2;

@WebServlet("/modifyPro")
public class ModifyProServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String aac201=null;
		try 
        {
			Map<String,Object> dto=FileUtil2.upload(request);
			if(dto.get("imageList")!=null)
			{
	            List<String> imageList = (List<String>) dto.get("imageList");          
	            //图片
	            String aac204=imageList.get(0);
	           	dto.put("aac204", aac204);
			}
			aac201=(String)dto.get("aac201");
            Ac02ServicesImpl service=new Ac02ServicesImpl();
            boolean tag=service.modifyPro(dto);
            if(tag)
            {
            	request.setAttribute("msg","作品修改成功");
            }
            else
            {
            	request.setAttribute("msg","作品修改失败");
            }
        }
        catch (Exception e)
        {
            //拿到我们的Exception异常信息
            String Msg=e.getMessage();
            request.setAttribute("errorMsg",Msg);
        }
        request.getRequestDispatcher("/findByIdPro.html?aac201="+aac201).forward(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
        this.doGet(request, response);
	}

}
