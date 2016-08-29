package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxConcertDAOImpl;
import net.box.db.BoxUserBean;

public class BoxConcertDetailAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		request.setCharacterEncoding("utf-8");
			
		BoxConcertDAOImpl concertdao=new BoxConcertDAOImpl();
		BoxConcertBean concertdata=new BoxConcertBean();
		BoxUserBean userdata= new BoxUserBean();
		
		int id=Integer.parseInt(request.getParameter("id"));
		String page = "1";
		if(request.getParameter("page") != null){
			page = request.getParameter("page");
		}
		
		concertdata=concertdao.getConcertCont(id);
		System.out.println("concertdata="+concertdata);
		
		
		if(concertdata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   		   	
		request.setAttribute("concertdata", concertdata);
		request.setAttribute("userdata", userdata);
		request.setAttribute("page", page);
		
	   	ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./ConBoardList.box");
		return forward;
	}
}
