package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoxConcertDetailAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		//...
		String concertId = (String)request.getParameter("id");
		System.out.println(concertId);
		
		// 1.id를 이용해 DB에서 concert 객체를 가져온다.
		
		// 2. request.setAttribute() 를 이용해 리퀘스트 객체에 담는다.
		
		forward.setRedirect(false);
		forward.setPath("./box/concert_detail.jsp");
		return forward;
	}
}
