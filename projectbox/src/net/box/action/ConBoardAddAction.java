package net.box.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

public class ConBoardAddAction implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");	
		PrintWriter out = response.getWriter();

		ConBoardDAOImpl conboarddao = new ConBoardDAOImpl();
		ConBoardBean conboarddata = new ConBoardBean();

		conboarddata.setConcertid(Integer.parseInt(request.getParameter("concertid")));
		conboarddata.setUserid(request.getParameter("userid"));
		conboarddata.setContent(request.getParameter("content"));

		

		try {
			if (conboarddata.getContent().length() > 200) {
				out.println("<script>");
				out.println("alert('200자를 초과할 수 없습니다!')");
				out.println("history.go(-1)");
				out.println("</script>");
		   		out.close();
				
			} else {
				System.out.println("concertid=" + conboarddata.getConcertid());
				System.out.println("userid=" + conboarddata.getUserid());
				System.out.println("content=" + conboarddata.getContent());
				
				conboarddao.conboardInsert(conboarddata);

				ActionForward forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("./ConBoardList.box?param=123");
				return forward;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}
}
