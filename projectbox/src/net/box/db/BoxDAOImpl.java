package net.box.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BoxDAOImpl {
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

	/* 음악 목록 */
	public List<BoxMusicBean> getMusicList() throws SQLException {
		SqlSession session = null;
		session = getSession();
		List<BoxMusicBean> list = session.selectList("box.music_list");
		return list;
	}

	/* 최신 곡 목록 */
	public List<BoxMusicBean> getRecentMusicList(int count) throws SQLException {
		SqlSession session = null;
		session = getSession();
		List<BoxMusicBean> list = session.selectList("box.recent_music_list", count);
		return list;
	}

	/* 공연 목록 */
	public List<BoxConcertBean> getConcertList() throws SQLException {
		SqlSession session = null;
		session = getSession();
		List<BoxConcertBean> list = session.selectList("box.concert_list");
		return list;
	}

	/* 요청게시글 목록 */
	public List<BoxGeneralBoardBean> getGeneralBoardList() throws SQLException {
		SqlSession session = null;
		session = getSession();

		List<BoxGeneralBoardBean>  list = session.selectList("board.mainboard_list");
	    return list;

//		List<BoxGeneralBoardBean> list = session.selectList("board.generalboard_list");
//		return list;
	}

	/* 선호도 삽입 */
	public int addPreference(BoxPreferenceBean preference) throws SQLException {
		SqlSession session = null;
		int result = 0;
		try {
			session = getSession();
			result = session.insert("box.add_preference", preference);
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	/* 선호도 조회 */
	public List<BoxPreferenceBean> getPreferenceList(String userId) throws SQLException {
		SqlSession session = null;
		session = getSession();
		List<BoxPreferenceBean> list = session.selectList("box.preference_list", userId);
		return list;
	}

	/* 추천곡 조회 */
	public List<BoxMusicBean> getRecommendedMusicList(List<BoxPreferenceBean> preferenceList, int count)
			throws SQLException {
		SqlSession session = null;
		session = getSession();

		List<Integer> similaritylist = new ArrayList<Integer>();
		List<Integer> excludemusiclist = new ArrayList<Integer>();

		for (BoxPreferenceBean preference : preferenceList) {
			similaritylist.add(preference.getSimilarity());
			excludemusiclist.add(preference.getMusicid());
		}

		Map map = new HashMap<String, Object>();
		map.put("similaritylist", similaritylist);
		map.put("excludemusiclist", excludemusiclist);
		map.put("count", count);

		List<BoxMusicBean> list = session.selectList("box.recommended_music_list", map);
		return list;
	}

	/* 추천공연 조회 */
	public List<BoxConcertBean> getRecommendedConcertList(List<BoxPreferenceBean> preferenceList, int count)
			throws SQLException {
		SqlSession session = null;
		session = getSession();

		List<Integer> similaritylist = new ArrayList<Integer>();

		for (BoxPreferenceBean preference : preferenceList) {
			similaritylist.add(preference.getSimilarity());
		}

		Map map = new HashMap<String, Object>();
		map.put("similaritylist", similaritylist);
		map.put("count", count);

		List<BoxConcertBean> list = session.selectList("box.recommended_concert_list", map);

		return list;
	}

	/* 유저조회 */
	public BoxUserBean getUserInfo(String userId) throws SQLException {
		SqlSession session = null;
		session = getSession();
		return (BoxUserBean) session.selectOne("box.user_info", userId);
	}
	
	
}
