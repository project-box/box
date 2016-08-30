package net.box.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.db.BoxConcertBean;
import net.box.db.BoxDAOImpl;
import net.box.db.BoxGeneralBoardBean;
import net.box.db.BoxMusicBean;
import net.box.db.BoxPreferenceBean;


 public class BoxMainAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

		BoxDAOImpl boxdao=new BoxDAOImpl();
		
		//List<BoxMusicBean> musiclist = boxdao.getMusicList();
		List<BoxMusicBean> musiclist = boxdao.getRecentMusicList(8);

		// 자바8의 람다식으로 리스트내의 null 아이템을 제거하는 코드, 화면 이미지 레이아웃이 깨지는 이유가 null
		// 아이템인줄 알아서 아래 코드를 적용했다가 적용해도 그대로라 주석처리함. 
		//musiclist = musiclist.parallelStream().filter(i -> i != null).collect(Collectors.toList());
		
		List<BoxConcertBean> concertlist = boxdao.getConcertList();
		//concertlist = concertlist.parallelStream().filter(i -> i != null).collect(Collectors.toList());
		
		List<BoxGeneralBoardBean> generalboardlist = boxdao.getGeneralBoardList();
		//generalboardlist = generalboardlist.parallelStream().filter(i -> i != null).collect(Collectors.toList());
		
		request.setAttribute("musiclist", musiclist);
		request.setAttribute("concertlist", concertlist);
		request.setAttribute("generalboardlist", generalboardlist);
		
		HttpSession session = request.getSession();
		if(session.getAttribute("loginId") != null){
			String loginId = session.getAttribute("loginId").toString();
			List<BoxPreferenceBean> preferencelist = boxdao.getPreferenceList(loginId);
			request.setAttribute("preferencelist", preferencelist);
			
			System.out.println(preferencelist.size());
		}
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./box/main.jsp");
 		return forward;
	 }
 }