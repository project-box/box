package net.box.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.BoxConcertBean;
import net.box.db.BoxConcertDAOImpl;
import net.box.db.BoxUserBean;
import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

public class BoxConcertDetailAction implements Action{
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
     	request.setCharacterEncoding("utf-8");
			
		BoxConcertDAOImpl concertdao=new BoxConcertDAOImpl();
		BoxConcertBean concertdata=new BoxConcertBean();
		BoxUserBean userdata= new BoxUserBean();
				
		ConBoardDAOImpl conboarddao=new ConBoardDAOImpl();	
		List <ConBoardBean> conboardlist=new ArrayList<ConBoardBean>();
				
		int id=Integer.parseInt(request.getParameter("id"));
		int page = 1;
		
		if(request.getParameter("page") != null){
			page = Integer.parseInt(request.getParameter("page"));
		}
				
		int listcount=conboarddao.getListCount(); //�� ����Ʈ ���� �޾ƿ�		
		
		concertdata=concertdao.getConcertCont(id);
		conboardlist = conboarddao.getConBoardList(page);		  	
			
		
		System.out.println("concertdata="+concertdata);		
		System.out.println("listcount="+listcount);
		System.out.println("conboardlist="+conboardlist);
		
		
		if(concertdata==null){
	   		System.out.println("상세보기 실패");
	   		return null;
	   	}
	   	System.out.println("상세보기 성공");
	   		   	
		request.setAttribute("concertdata", concertdata);
		request.setAttribute("userdata", userdata);
		request.setAttribute("page", page);
		
		int limit=10; 
		
		//총 페이지 수
 		int maxpage=(int)((double)listcount/limit+0.95); //0.95를 더해서 올림 처리
 		
 		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
 		
 		//현재 페이지에 보여줄 마지막 페이지 수(10, 20, 30 등...)
		int endpage = startpage+10-1;

 		if(endpage> maxpage) endpage= maxpage;
		
		request.setAttribute("page", page); 
 		request.setAttribute("maxpage", maxpage); 
 		request.setAttribute("startpage", startpage); 
 		request.setAttribute("endpage", endpage); 
		request.setAttribute("listcount",listcount); 
		request.setAttribute("conboardlist", conboardlist);		
		
		
		ActionForward forward= new ActionForward();
 		forward.setRedirect(false);
	   	forward.setPath("./box/concert_detail.jsp");
 		return forward;
	}
}
