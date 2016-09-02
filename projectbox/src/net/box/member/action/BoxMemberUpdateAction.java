package net.box.member.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.action.Action;
import net.box.action.ActionForward;

public class BoxMemberUpdateAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		System.out.println("들어옴1");	
		
		
		
		ActionForward forward= new ActionForward();
 		forward.setRedirect(false);
	   	forward.setPath("./box/member_update.jsp");
 		return forward;
		

}
}
