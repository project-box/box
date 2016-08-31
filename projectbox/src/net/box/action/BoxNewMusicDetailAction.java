package net.box.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxDAOImpl;
import net.box.db.BoxGeneralBoardBean;
import net.box.db.BoxMusicBean;
import net.box.db.BoxNewmusicDAOImpl;
import net.box.db.BoxMusicBean;

public class BoxNewMusicDetailAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		BoxNewmusicDAOImpl boxdao=new BoxNewmusicDAOImpl();
		BoxMusicBean Newmusicdata=new BoxMusicBean();
		
		
		int num=Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");
//		boxdao.setReadCountUpdate(num);
	   	Newmusicdata=boxdao.getNewmusicCont(num);
	   	
		
	   	if(Newmusicdata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   	
	   	request.setAttribute("Newmusicdata", Newmusicdata);
	   	request.setAttribute("page", page);
		
	   	
	   	ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./box/New_music_detail.jsp");
 		return forward;
	 }
}
