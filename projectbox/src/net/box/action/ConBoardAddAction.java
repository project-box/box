package net.box.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

	public class ConBoardAddAction implements Action {
		 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
			
			 
			 request.setCharacterEncoding("UTF-8");
			 
			 
			 ConBoardDAOImpl conboarddao=new ConBoardDAOImpl();
			 ConBoardBean conboarddata=new ConBoardBean();
			 
			 conboarddata.setConcertid(Integer.parseInt(request.getParameter("concertid")));
			 conboarddata.setUserid(request.getParameter("userid"));
			 conboarddata.setContent(request.getParameter("content"));
			  
			 System.out.println("concertid="+conboarddata.getConcertid());
			 System.out.println("userid="+conboarddata.getUserid());
			 System.out.println("content="+conboarddata.getContent());
			 
			try{ 
				
			conboarddao.conboardInsert(conboarddata);
			
			ActionForward forward=new ActionForward();
			 forward.setRedirect(true);
		     forward.setPath("./ConBoardList.box?param=123");
		   	 return forward;
		   	 
			}catch(Exception ex){
	   			ex.printStackTrace();
	   		}
	  		return null;
		}  	
	}
		
			
			
	
		
	
