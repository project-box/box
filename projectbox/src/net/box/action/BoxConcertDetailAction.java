package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxConcertDAOImpl;

public class BoxConcertDetailAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
		System.out.println("들어옴1");		
		
		BoxConcertDAOImpl concertdao=new BoxConcertDAOImpl();
		BoxConcertBean concertdata=new BoxConcertBean();
		
		int id=Integer.parseInt(request.getParameter("id"));
		String page = "1";
		if(request.getParameter("page") != null){
			page = request.getParameter("page");
		}
		System.out.println("들어옴2");
		
		concertdata=concertdao.getConcertCont(id);
		System.out.println("concertdata="+concertdata);
		System.out.println("들어옴3");	
		
		if(concertdata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
		request.setAttribute("concertdata", concertdata);
		request.setAttribute("page", page);
		
	   	ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ConBoardList.box");
		return forward;
	}
}
