package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxBoardDaoImpl;
import net.box.db.BoxGeneralBoardBean;

public class BoxBoardDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		BoxGeneralBoardBean boardbean = new BoxGeneralBoardBean();
		BoxBoardDaoImpl boarddao=new BoxBoardDaoImpl();
		
		String page = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		
		System.out.println("page="+page);
		System.out.println("id="+id);
		System.out.println("password="+password);		
		
//		boardbean.setId(id);
//		boardbean.setUserid(request.getParameter("userid"));  		
 	 
		BoxGeneralBoardBean oldbean = boarddao.getBoardCont(id); 
		
 		/* 회원테이블의 비번과 비교하는 부분 */
 		if(!password.equals(oldbean.getPassword())){
 			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('비번이 일치하지 않습니다.');");	   
	   		out.println("history.go(-1)");
	   		out.println("</script>");
	   		out.close();
	   		return null; 			
 		} 		
 		
 		boarddao.boardDelete(id); 		
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(true);
 		forward.setPath("./boardList.box");
 		
 		return forward;		
		
	}
}