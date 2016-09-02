package net.box.member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.action.Action;
import net.box.action.ActionForward;
import net.box.member.db.MemberDAO;

public class BoxMemberDeleteAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		System.out.println("삭제");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		MemberDAO memberdao = new MemberDAO();

		String userid = (String) session.getAttribute("id");
		String userpass = (String) session.getAttribute("password");
		String inputid = request.getParameter("inputid");
		String inputpass = request.getParameter("inputPass");

		System.out.println("inputid");
		
		
			if (!inputid.equals(userid)) {
				out.println("<script>");
				out.println("alert('아이디가 일치하지 않습니다!');");
				out.println("location.href='/projectbox/MemberDeleteForm.box';");
				out.println("</script>");
				out.close();
				return null;
				
			} else if (!inputpass.equals(userpass)) {

				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다!');");
				out.println("location.href='/projectbox/MemberDeleteForm.box';");
				out.println("</script>");
				out.close();
				return null;
			} else {

				/*memberdao.MemberDelete(inputid);*/

				out.println("<script>");
				out.println("alert('탈퇴되었습니다.');");
				out.println("location.href='/projectbox/main.box;");
				out.println("</script>");
				out.close();
				return null;
			}

	
	}
}
