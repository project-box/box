package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoxConcertListAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		ActionForward forward = new ActionForward();
		
		// 1. DB 조회해서 추천공연 리스트 데이터 가져온다.
		
		// 2. request 객체에 조회한 데이터를 담는다.
		
		forward.setRedirect(false);
		forward.setPath("./box/concert_list.jsp");
		return forward;
	}
}
