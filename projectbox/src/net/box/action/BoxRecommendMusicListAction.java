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

		BoxDAOImpl boxdao=new BoxDAOImpl();
		
		List<BoxMusicBean> musiclist = boxdao.getMusicList();
		request.setAttribute("musiclist", musiclist);
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./box/recommend_music_list.jsp");
 		return forward;
	 }
}
