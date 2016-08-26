package net.box.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxDAOImpl;
import net.box.db.BoxGeneralBoardBean;
import net.box.db.BoxMusicBean;
import net.box.action.ActionForward;
import net.box.db.BoxNewmusicDAOImpl;

public class BoxNewMusicListAction implements Action {
	public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		BoxNewmusicDAOImpl Newmusicdao=new BoxNewmusicDAOImpl();
		List Newmusiclist=new ArrayList();
		
		int page=1; // 현재 페이지 번호
		int limit=10; // 한 화면에 출력할 레코드 갯수
		
		if(request.getParameter("page") != null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		int listcount=Newmusicdao.getListCount(); //총 리스트 수를 받아옴
//		boardlist = boarddao.getBoardList(page,limit); //리스트를 받아옴
		Newmusiclist = Newmusicdao.getNewmusicList(page);
		
		//총 페이지 수
 		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
 		
 		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		
 		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage+10-1;

 		if(endpage> maxpage) endpage= maxpage;
 		
 		int num = listcount-(page-1)*10; 		
 		
 		request.setAttribute("page", page); //현재 페이지 수
 		request.setAttribute("maxpage", maxpage); //최대 페이지 수
 		request.setAttribute("startpage", startpage); //현재 페이지에 표시할 첫 페이지 수
 		request.setAttribute("endpage", endpage); //현재 페이지에 표시할 끝 페이지 수
		request.setAttribute("listcount",listcount); //글 수
		request.setAttribute("Newmusiclist", Newmusiclist);		
		
		ActionForward forward= new ActionForward();
	 	forward.setRedirect(false);
 		forward.setPath("./box/New_music_list.jsp");
 		return forward;
	 }
 }