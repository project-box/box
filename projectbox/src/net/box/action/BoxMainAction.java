package net.box.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxDAOImpl;


 public class BoxMainAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{

//		BoardDAO boarddao=new BoardDAO();
		BoxDAOImpl boxdao=new BoxDAOImpl();
		
		List musiclist=new ArrayList();
		musiclist = boxdao.getMusicList();
		
		List concertlist=new ArrayList();
		concertlist = boxdao.getConcertList();
		
		List generalboardlist=new ArrayList();
		generalboardlist = boxdao.getGeneralBoardList();

		request.setAttribute("musiclist", musiclist);
		request.setAttribute("concertlist", concertlist);
		request.setAttribute("generalboardlist", generalboardlist);
		
		ActionForward forward= new ActionForward();		
	 	forward.setRedirect(false);
 		forward.setPath("./box/main.jsp");
 		return forward;
	 }
 }