package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ConcertTicketAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("들어옴1");	
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./box/ticket.jsp");
		return forward;
		
	}
}
