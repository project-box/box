package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

public class ConBoardAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("loginId");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");	
		PrintWriter out = response.getWriter();
		
		
		ConBoardDAOImpl conboarddao = new ConBoardDAOImpl();
		ConBoardBean conboarddata = new ConBoardBean();
		
		conboarddata.setConcertid(Integer.parseInt(request.getParameter("concertid")));
		conboarddata.setUserid(request.getParameter("userid"));
		conboarddata.setContent(request.getParameter("content"));
		
		
//		String page = request.getParameter("page");
//		String userid =  null;
//		if(request.getParameter("userid") != null){
//			userid=request.getParameter("userid");
//		}
		
		int concertid = Integer.parseInt(request.getParameter("concertid"));
		
		try {
			if( userid == null){
				out.println("<script>");
		   		out.println("alert('로그인이 필요 합니다!');");
		   		out.println("location.href='/projectbox/login.box';");
		   		out.println("</script>");
		   		out.close();
		   		return null;
			}else if(conboarddata.getContent().length() > 200){
				out.println("<script>");
				out.println("alert('200자를 초과할 수 없습니다!')");
				out.println("location.href='/projectbox/ConcertDetail.box?param=123&id="+concertid+"';");
				out.println("</script>");
		   		out.close();	
		   		return null;
			}else{
				
				System.out.println("concertid=" + conboarddata.getConcertid());
				System.out.println("userid=" + conboarddata.getUserid());
				System.out.println("content=" + conboarddata.getContent());
				
				conboarddao.conboardInsert(conboarddata);

				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./ConcertDetail.box?param=123&id="+conboarddata.getConcertid());
				return forward;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
