package net.box.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import net.board.db.BoardBean;

public class BoxDAOImpl {
	private SqlSession getSession() {
		SqlSession session=null;
		Reader reader=null;
		try {
			reader = Resources.getResourceAsReader("./SqlMapConfig.xml");
			SqlSessionFactory sf = new SqlSessionFactoryBuilder().build(reader);
			session = sf.openSession(true);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return session;
	}	
	
	/* 음악 목록 */
	public List<BoxMusicBean> getMusicList() throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxMusicBean> list = session.selectList("box.music_list");
	    return list;
	}
	
	/* 최신 곡 목록 */
	public List<BoxMusicBean> getRecentMusicList(int count) throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxMusicBean> list = session.selectList("box.recent_music_list", count);
	    return list;
	}
	
	/* 공연 목록 */
	public List<BoxConcertBean> getConcertList() throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxConcertBean> list = session.selectList("box.concert_list");
	    return list;
	}
	
	/* 요청게시글 목록 */
	public List<BoxGeneralBoardBean> getGeneralBoardList() throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxGeneralBoardBean> list = session.selectList("board.generalboard_list");
	    return list;
	}
}
