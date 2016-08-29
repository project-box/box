package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.ConBoardBean;
import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

public class ConBoardDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 
		 response.setContentType("text/html;charset=utf-8");	
					
		ActionForward forward = new ActionForward();
			request.setCharacterEncoding("utf-8");
			
			
		int id=Integer.parseInt(request.getParameter("id"));
		   	String page = request.getParameter("page");
		   	
		   	
		   	ConBoardDAOImpl conboarddao=new ConBoardDAOImpl();	
		   	
		   	conboarddao.conboardDelete(id);
				   		
	   		
			forward.setRedirect(true);
		   	forward.setPath("./ConBoardList.box?page="+page+"&param=123");
		   	return forward;
			
		}
	 }