package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoxLogoutAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		HttpSession session=request.getSession();
		session.invalidate();
		
		forward.setRedirect(true);
		forward.setPath("./main.box");
		return forward;
	}
}
