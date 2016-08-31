package net.box.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.action.Action;
import net.box.action.ActionForward;
import net.box.member.db.MemberBean;
import net.box.member.db.MemberDAO;

public class JoinFormAction implements Action{
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) 
	 	throws Exception{
		 	request.setCharacterEncoding("utf-8");
		 	
		 	ActionForward forward = new ActionForward();
		 	
			MemberDAO memberdao=new MemberDAO();
	   		MemberBean member=new MemberBean();
	   		
	   		boolean result=false;
	   		   	   		
	   		member.setId(request.getParameter("MEMBER_ID"));
	   		member.setPassword(request.getParameter("MEMBER_PW1"));
	   		member.setName(request.getParameter("MEMBER_NAME"));
	   		
	   		String email = request.getParameter("MEMBER_Email1")+"@"+request.getParameter("MEMBER_Email2"); 
	   		member.setEmail(email);
	   		
	   		member.setGender(request.getParameter("MEMBER_GENDER"));
	   		
	   		String phone = request.getParameter("MEMBER_PHONE1")
	   				     + "-" +request.getParameter("MEMBER_PHONE2")
	   				     + "-" +request.getParameter("MEMBER_PHONE3");
	   		member.setPhone(phone);
	   		
	   		member.setAge(Integer.parseInt(request.getParameter("MEMBER_AGE")));
	   		   			   		
	   		int res = memberdao.insert(member);
   			if(res==0){
	   			System.out.println("회원가입 실패");
		   		return null;
		   	}
	   		
	   		//---회원가입 성공.---
   			
   			// 세션 등록
   			HttpSession session=request.getSession();
   			session.setAttribute("loginId", member.getId());
	   		session.setAttribute("loginName", member.getName());
	   		
	   		forward.setRedirect(true);
	   		forward.setPath("./main.box");
	   		return forward;
	}
}