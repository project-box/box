package net.box.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxDAOImpl;
import net.box.db.BoxGeneralBoardBean;
import net.box.db.BoxMusicBean;

public class BoxRecommendMusicListAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

//		BoardDAO boarddao=new BoardDAO();
		BoxDAOImpl boxdao=new BoxDAOImpl();
		
		System.out.println("추천리스트 액션");
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./box/recommend_music_list.jsp");
 		return forward;
	 }
}
