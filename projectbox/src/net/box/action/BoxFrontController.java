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
		System.out.println("");

		if (command.equals("/frontpage.box")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./board/qna_board_write.jsp");

			// 메인 화면
		} else if (command.equals("/main.box")) {
			action = new BoxMainAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 전체 게시판 목록
		} else if (command.equals("/boardList.box")) {
			action = new BoxBoardListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 게시판 상세 페이지
		} else if (command.equals("/boardCont.box")) {
			action = new BoxBoardContAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			// 게시판 글작성 폼
		} else if (command.equals("/boardWrite.box")) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("./box/boardwrite.jsp");
		}

		// 게시판 글작성
		else if (command.equals("/boardWritePro.box")) {
			action = new BoxBoardWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 게시판 수정폼
		else if (command.equals("/boardModify.box")) {
			action = new BoxBoardModify();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 게시판 수정
		else if (command.equals("/boardModifyAction.box")) {
			action = new BoxBoardModifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		// 게시판 삭제폼
		else if (command.equals("/boardDelete.box")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./box/boarddelete.jsp");
		}

		// 게시판 삭제
		else if (command.equals("/boardDeleteAction.box")) {
			action = new BoxBoardDeleteAction();
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

	}// doprocess() end

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}
}