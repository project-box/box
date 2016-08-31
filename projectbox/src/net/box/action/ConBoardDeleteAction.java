package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

public class ConBoardDeleteAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 			
		 response.setContentType("text/html;charset=utf-8");			
		 PrintWriter out=response.getWriter();//출력 스트림 객체생성
		 					 			
		/*ActionForward forward = new ActionForward();*/
					
		int concertid=Integer.parseInt(request.getParameter("concertid"));			
		int id=Integer.parseInt(request.getParameter("id"));
		String page = request.getParameter("page");
		String userid=request.getParameter("userid");
		
		ConBoardDAOImpl conboarddao=new ConBoardDAOImpl();	
		  /*ConBoardBean conboard = conboarddao.getConBoardCont(id);*/		
		
		if( userid == null){
			out.println("<script>");
	   		out.println("alert('로그인이 필요합니다!');");
	   		out.println("location.href='./ConcertDetail.box?page="+page+"&param=123&id="+concertid+"';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
   		}else if(!userid.equals("dev") || userid == null){   			
	   		out.println("<script>");
	   		out.println("alert('삭제할 권한이 없습니다!');");
	   		out.println("location.href='./ConcertDetail.box?page="+page+"&param=123&id="+concertid+"';");
	   		out.println("history.go(-1)");
	   		out.println("</script>");
	   		out.close();
	   		return null;
   		}else{   			
		   	conboarddao.conboardDelete(id);					
			
		   	out.println("<script>");
	   		out.println("alert('삭제되었습니다.');");
	   		out.println("location.href='./ConcertDetail.box?page="+page+"&param=123&id="+concertid+"';");
	   	   	out.println("</script>");
	   		out.close();
	   		
	   		return null;	   		
   		}
			/*forward.setRedirect(true);
		   	forward.setPath("./ConBoardList.box?page="+page+"&param=123");
		   	return forward;*/
			
		}
	 }