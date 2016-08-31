package net.box.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import net.board.db.BoardBean;

public class BoxConcertDAOImpl {
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
	
	/* 게시판 글내용보기 */
	public BoxConcertBean getConcertCont(int id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoxConcertBean) session.selectOne("concert.concert_cont", id);
	}	
	
	
	
	
	

}
