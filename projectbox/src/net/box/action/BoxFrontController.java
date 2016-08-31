package net.box.action;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.box.member.action.JoinFormAction;
import net.box.member.action.MemberIdCheckAction;

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

			/*
			 * forward = new ActionForward(); forward.setRedirect(false);
			 * forward.setPath("./board/qna_board_write.jsp");
			 */
			//github.com/project-box/box.git
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

		} else if (command.equals("/loginAction.box")) {
			action = new BoxLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/logoutAction.box")) {
			action = new BoxLogoutAction();
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

		} else if (command.equals("/BoxNewmusicAddAction.box")) {
			action = new BoxNewmusicAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NewmusicWrite.box")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./box/New_music_write.jsp");
		} else if (command.equals("/BoxNewmusicAddAction.box")) {
			action = new BoxNewmusicAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {

				e.printStackTrace();
			}

		} else if (command.equals("/NewMusicList.box")) {
			action = new BoxNewMusicListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NewmusicDetailAction.box")) {
			action = new BoxNewMusicDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/NewMusicList.box")) {
			action = new BoxNewMusicListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/NewmusicDetailAction.box")) {

			action = new BoxNewMusicDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/BoxNewMusicDetail.box")) {
			action = new BoxNewMusicDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/mypage.box")) {

			forward = new ActionForward();

			forward = new ActionForward();

			forward.setRedirect(false);
			forward.setPath("./box/mypage.jsp");

		} else if (command.equals("/login.box")) {
			System.out.println("login.box 들어옴");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./box/login.jsp");

		} else if (command.equals("/NewmusicWrite.box")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./box/New_music_write.jsp");

		} else if (command.equals("/loginAction.box")) {
			action = new BoxLoginAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		// 컨서트 상세 페이지 요청	
		} else if (command.equals("/ConcertDetail.box")) {
			action = new BoxConcertDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}			
			
		} else if(command.equals("/ConcertList.box")){

		}

		

		/* 예매하기 버튼 클릭 */
		else if (command.equals("/ConcertTicket.box")) {
			action = new ConcertTicketAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			/* 후기 저장 */
		} else if (command.equals("/ConBoardAddAction.box")) {
			action = new ConBoardAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

			/*
			 * 후기 목록 출력 }else if (command.equals("/ConBoardList.box")) { action
			 * = new ConBoardListAction(); try { forward =
			 * action.execute(request, response); } catch (Exception e) {
			 * e.printStackTrace(); }
			 */

			/* 후기 삭제 */
		} else if (command.equals("/ConBoardDeleteAction.box")) {
			action = new ConBoardDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (command.equals("/ConcertList.box")) {
			action = new BoxConcertListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();


			}
		} else if (command.equals("/PreferenceListAction.box")) {
			action = new BoxPreferenceListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();

			}


		} else if (command.equals("/PreferenceAddAction.box")) {
			action = new BoxPreferenceAddAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberJoin.box")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("./box/joinForm.jsp");

		} else if (command.equals("/MemberJoinAction.box")) {
			action = new JoinFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/idCheck.box")) { // id 중복검사
			action = new MemberIdCheckAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			// 회원관련 끝

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