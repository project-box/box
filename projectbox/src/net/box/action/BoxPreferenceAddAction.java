package net.box.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.db.BoxDAOImpl;
import net.box.db.BoxPreferenceBean;

public class BoxPreferenceAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ActionForward forward = new ActionForward();
		BoxDAOImpl boxdao=new BoxDAOImpl();
		
		HttpSession session = request.getSession();
		String loginId = session.getAttribute("loginId").toString();

		Enumeration<String> parameterNames = request.getParameterNames();

		while (parameterNames.hasMoreElements()) {

			String paramName = parameterNames.nextElement();

			String paramValue = request.getParameter(paramName);
			
			String musicId = paramName.split("id.")[1];
			String rate = paramValue.split("val.")[1];
			
			System.out.println(musicId);
			System.out.println(rate);
			
			// 데이터 삽입...
			BoxPreferenceBean preference = new BoxPreferenceBean();
			preference.setUserid(loginId);
			preference.setMusicid(Integer.parseInt(musicId));
			preference.setRate(Float.parseFloat(rate));
			
			boxdao.addPreference(preference);
		}

		forward.setRedirect(true);
		forward.setPath("./main.box");
		return forward;
	}
}
