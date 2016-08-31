package net.box.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoxBoardDaoImpl {
	private SqlSession getSession() {
		SqlSession session = null;
		Reader reader = null;
		try {
			reader = Resources.getResourceAsReader("./SqlMapConfig.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			session = sf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return session;
	}

	/* 전체 게시물 갯수 */
	public int getListCount() throws Exception {
		SqlSession session = null;
		session = getSession();
		int result = (Integer) session.selectOne("board_count");
		return result;
	}

	/* 전체 게시물 목록 */
	public List getBoardList(int page) throws Exception {
		SqlSession session = null;
		session = getSession();
		List list = session.selectList("board_list", page);
		return list;
	}
	
	/* 게시판 글작성 */ 
	public void boardInsert(BoxGeneralBoardBean boardbean) throws Exception{
		SqlSession session = null;
		session = getSession();
		session.insert("board_insert", boardbean);
	}

	/* 게시판 조회수 증가 */
	public void boardHit(int id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("board.board_hit", id);
	}
	
	
	
	/* 게시판 글내용보기 */
	public BoxGeneralBoardBean getBoardCont(int id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoxGeneralBoardBean) session.selectOne("board_cont", id);
	}	

	/* 게시물 수정 */
	public void boardUpdate(BoxGeneralBoardBean board) throws SQLException {
		SqlSession session=null;
		session = getSession();	
		
		session.update("board_edit", board);		
	}

	/* 게시물 삭제 */
	public void boardDelete(int id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("board_del", id);
	}
	
	
}
