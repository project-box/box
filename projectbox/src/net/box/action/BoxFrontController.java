package net.box.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.board.action.BoardAddAction;
import net.board.action.BoardDeleteAction;
import net.board.action.BoardDetailAction;
import net.board.action.BoardModifyAction;
import net.board.action.BoardModifyView;
import net.board.action.BoardReplyAction;
import net.board.action.BoardReplyView;

@WebServlet("*.box")
public class BoxFrontController extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		ActionForward forward = null;
		Action action = null;

		System.out.println("RequestURI=" + RequestURI);
		System.out.println("contextPath=" + contextPath);
		System.out.println("command=" + command);

		if (command.equals("/frontpage.box")) {
			/*
			 * forward = new ActionForward(); forward.setRedirect(false);
			 * forward.setPath("./board/qna_board_write.jsp");
			 */
		} else if (command.equals("/main.box")) {
			action = new BoxMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if (command.equals("/recommendMusicList.box")) {
			action = new BoxRecommendMusicListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		
		} else if (command.equals("/NewmusicWrite.box")) {
			forward = new ActionForward(); forward.setRedirect(false);
			forward.setPath("./box/New_music_write.jsp");
		
		}else if(command.equals("/BoxNewmusicAddAction.box")){
			action = new BoxNewmusicAddAction();
			try {
					forward = action.execute(request, response);
			} catch (Exception e) {
					e.printStackTrace();
			}		
		
		}else if(command.equals("/NewMusicList.box")){
				action = new BoxNewMusicListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
		}else if(command.equals("/NewmusicDetailAction.box")){
			action = new BoxNewMusicDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/mypage.box")) {
			forward = new ActionForward(); forward.setRedirect(false);
			forward.setPath("./box/mypage.jsp");
		
		} else if(command.equals("/login.box")){
			forward = new ActionForward(); forward.setRedirect(false);
			forward.setPath("./box/login.jsp");

		
		} else if(command.equals("/loginAction.box")){
			action = new BoxLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		

		if (forward != null) {
			if (forward.getRedirect()) { // true
				response.sendRedirect(forward.getPath());
			} else { // false 값전달이 가능함
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}// doprocess()
																															// end

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}