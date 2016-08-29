package net.box.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.db.ConBoardBean;
import net.box.db.ConBoardDAOImpl;

public class ConBoardListAction implements Action {
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		 request.setCharacterEncoding("UTF-8");

		 
		 
		 ConBoardDAOImpl conboarddao=new ConBoardDAOImpl();
		 List <ConBoardBean> conboardlist=new ArrayList<ConBoardBean>();
		 
		 int page=1; // ���� ������ ��ȣ
			int limit=10; // �� ȭ�鿡 ����� ���ڵ� ����
	
			
			
			if(request.getParameter("page") != null){
				page=Integer.parseInt(request.getParameter("page"));
			}
			
			int listcount=conboarddao.getListCount(); //�� ����Ʈ ���� �޾ƿ�
			conboardlist = conboarddao.getConBoardList(page);
			
			System.out.println("listcount="+listcount);
			System.out.println("conboardlist="+conboardlist);
			
			//�� ������ ��
	 		int maxpage=(int)((double)listcount/limit+0.95); //0.95�� ���ؼ� �ø� ó��
	 		
	 		//���� �������� ������ ���� ������ ��(1, 11, 21 ��...)
	 		int startpage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
	 		
	 		//���� �������� ������ ������ ������ ��(10, 20, 30 ��...)
			int endpage = startpage+10-1;

	 		if(endpage> maxpage) endpage= maxpage;
	 			 		
	 		int number = listcount-(page-1)*10; 
	 		
	 		request.setAttribute("page", page); //���� ������ ��
	 		request.setAttribute("maxpage", maxpage); //�ִ� ������ ��
	 		request.setAttribute("startpage", startpage); //���� �������� ǥ���� ù ������ ��
	 		request.setAttribute("endpage", endpage); //���� �������� ǥ���� �� ������ ��
			request.setAttribute("listcount",listcount); //�� ��
			request.setAttribute("conboardlist", conboardlist);	
			
			ActionForward forward= new ActionForward();
	 		forward.setRedirect(false);
		   	forward.setPath("./box/concert_detail.jsp?");
	 		return forward;
	 		
	 }
	 }
