package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.action.Action;
import net.box.action.ActionForward;
import net.box.db.BoxBoardDaoImpl;
import net.box.db.BoxGeneralBoardBean;

public class BoxBoardContAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{ 
		request.setCharacterEncoding("utf-8");
  		
		BoxBoardDaoImpl boarddao=new BoxBoardDaoImpl();
		BoxGeneralBoardBean boarddata=new BoxGeneralBoardBean();
	   	
		int num=Integer.parseInt(request.getParameter("id"));
		String page = request.getParameter("page");

		boarddao.boardHit(num); //조회수 증가
		boarddata=boarddao.getBoardCont(num);//내용보기
	   	
	   	if(boarddata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("boarddata", boarddata);
	   	request.setAttribute("page", page);
	   
	   	ActionForward forward = new ActionForward();
	   	forward.setRedirect(false);
  		forward.setPath("./box/boardview.jsp");
  		return forward;

	 }
}