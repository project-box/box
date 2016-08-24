package net.box.action;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxDAOImpl;
import net.box.db.BoxGeneralBoardBean;
import net.box.db.BoxMusicBean;


 public class BoxMainAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

//		BoardDAO boarddao=new BoardDAO();
		BoxDAOImpl boxdao=new BoxDAOImpl();
		
		List<BoxMusicBean> musiclist = boxdao.getMusicList();

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
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./box/main.jsp");
 		return forward;
	 }
 }