package net.box.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.action.Action;
import net.box.action.ActionForward;

public class BoxLoginAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();

		// ... 로그인
		String userId = request.getParameter("MEMBER_ID");
		String userPassword = request.getParameter("MEMBER_PW");
		System.out.println("회원인증 userId="+userId);
		System.out.println("회원인증 userPassword="+userPassword);
		
		/*BoxDAOImpl boxdao = new BoxDAOImpl();

		BoxUserBean user = boxdao.getUserInfo(userId);
		System.out.println("회원 인증 user="+user);
		
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
		}*/

		forward.setRedirect(true);
		forward.setPath("./main.box");
		return forward;

	}
}
