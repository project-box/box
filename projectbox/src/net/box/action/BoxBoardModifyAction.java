package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxBoardDaoImpl;
import net.box.db.BoxGeneralBoardBean;

public class BoxBoardModifyAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		BoxGeneralBoardBean boardbean = new BoxGeneralBoardBean();
		BoxBoardDaoImpl boarddao=new BoxBoardDaoImpl();
		
		String page = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("id"));
		String password = request.getParameter("password");
		
		boardbean.setId(id);
//		boardbean.setUserid(request.getParameter("userid"));
//		boardbean.setPassword(request.getParameter("password"));
 		boardbean.setName(request.getParameter("name"));
 		boardbean.setTitle(request.getParameter("title"));
 		boardbean.setContent(request.getParameter("content"));
// 		
// 		System.out.println("userid="+boardbean.getUserid());
 		System.out.println("id="+boardbean.getId());
 		System.out.println("name="+boardbean.getName());
 		System.out.println("title="+boardbean.getTitle());
 		System.out.println("content="+boardbean.getContent()); 
 		
 		BoxGeneralBoardBean oldbean = boarddao.getBoardCont(id); 
 		System.out.println("글 수정 boardbean="+boardbean);
 		
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
 		
 		boarddao.boardUpdate(boardbean); 		
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(true);
 		forward.setPath("./boardCont.box?id="+id+"&page="+page);
 		
 		return forward;		
		
	}
}