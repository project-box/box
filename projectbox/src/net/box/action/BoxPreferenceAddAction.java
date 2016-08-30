package net.box.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoxPreferenceAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();

		HttpSession session = request.getSession();
		String loginId = session.getAttribute("loginId").toString();

		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {

			String paramName = parameterNames.nextElement();

			System.out.println(paramName);

			String paramValue = request.getParameter(paramName);
			System.out.println(paramValue);
			
			// 데이터 삽입...
			
		}

		forward.setRedirect(true);
		forward.setPath("./main.box");
		return forward;
	}
}
