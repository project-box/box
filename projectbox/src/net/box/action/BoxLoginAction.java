package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoxLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		
		// ... 로그인

		forward.setRedirect(true);
		forward.setPath("./main.bo");
		return forward;
		
	}
}
