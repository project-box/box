package net.box.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.action.Action;
import net.box.action.ActionForward;
import net.box.member.db.MemberDAO;

// id 중복검사 하는 Action 클래스
public class MemberIdCheckAction implements Action {
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		ActionForward forward = new ActionForward();
		
		MemberDAO memberdao = new MemberDAO();
		String id = request.getParameter("id");
		System.out.println("id="+id);
		
		int result = 0; //  
		result = memberdao.idCheck(id);
		// result=1 (ID가 존재하는 경우)
		// result=-1 (ID가 존재하지 않는 경우)
		System.out.println("result="+result);
		
		request.setAttribute("result", result );		
		
		forward.setRedirect(false);
		forward.setPath("./box/idCheck.jsp");
		return forward;
	}

}
