package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.db.BoxDAOImpl;
import net.box.db.BoxUserBean;

public class BoxLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		// ... 로그인
		String userId = request.getParameter("inputId");
		String userPassword = request.getParameter("inputPassword");

		BoxDAOImpl boxdao = new BoxDAOImpl();

		BoxUserBean user = boxdao.getUserInfo(userId);

		if (user != null) {
			if(user.getPassword().equals(userPassword)){
				// 로그인 성공
				HttpSession session=request.getSession();
		   		session.setAttribute("loginId", user.getId());
		   		session.setAttribute("loginName", user.getName());
		   		
			}else{
				// 패스워드 틀림
				response.setContentType("text/html;charset=utf-8");
		   		PrintWriter out=response.getWriter();
		   		out.println("<script>");
		   		out.println("alert('비밀번호가 일치하지 않습니다.');");
		   		out.println("location.href='./login.box';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}
		} else {
			// 사용자가 없음.
			response.setContentType("text/html;charset=utf-8");
	   		PrintWriter out=response.getWriter();
	   		out.println("<script>");
	   		out.println("alert('아이디가 존재하지 않습니다.');");
	   		out.println("location.href='./login.box';");
	   		out.println("</script>");
	   		out.close();
	   		return null;
		}

		forward.setRedirect(true);
		forward.setPath("./main.box");
		return forward;

	}
}
