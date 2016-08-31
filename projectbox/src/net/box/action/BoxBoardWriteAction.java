package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxBoardDaoImpl;
import net.box.db.BoxGeneralBoardBean;

public class BoxBoardWriteAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		BoxGeneralBoardBean boardbean = new BoxGeneralBoardBean();
		BoxBoardDaoImpl boarddao=new BoxBoardDaoImpl();		
		
		boardbean.setUserid(request.getParameter("userid"));
		boardbean.setPassword(request.getParameter("password"));
 		boardbean.setName(request.getParameter("name"));
 		boardbean.setTitle(request.getParameter("title"));
 		boardbean.setContent(request.getParameter("content"));
 		
 		System.out.println("userid="+boardbean.getUserid());
 		System.out.println("name="+boardbean.getName());
 		System.out.println("title="+boardbean.getTitle());
 		System.out.println("content="+boardbean.getContent()); 		
 		
 		boarddao.boardInsert(boardbean); 		
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(true);
 		forward.setPath("./boardList.box");
 		
 		return forward;		
		
	}
}
