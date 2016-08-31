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

import net.box.db.BoxMusicBean;

public class BoxNewconcertDAOImpl {
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
	/*공연 목록 */
	public List<BoxConcertBean> getNewconcertList(int page) throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxConcertBean>  list = session.selectList("Newconcert.concert_list",page);
		System.out.println("list="+list);
		
	    return list;
	}
	
	/* 게시판 저장 */
	public void NewconcertInsert(BoxConcertBean concertBeen) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert1");
			
			System.out.println("Title="+concertBeen.getTitle());
			System.out.println("Artist="+concertBeen.getArtist());
			System.out.println("showtime="+concertBeen.getShowtime());
			System.out.println("Place="+concertBeen.getPlace());
			System.out.println("Startdate="+concertBeen.getStartdate());
			System.out.println("enddate="+concertBeen.getEnddate());
			System.out.println("posterfilepath="+concertBeen.getPosterfilepath());
			System.out.println("similarity="+concertBeen.getSimilarity());			
			
			result=session.insert("Newconcert.concert_insert", concertBeen);
			System.out.println("result="+result);
			
		}catch(Exception e){
			System.out.println("result="+result);
			System.out.println(e.getMessage());
		}
	}	
	
	/* 게시판 총 게시물 수 */
	public int getListCount() throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		count = ((Integer) session.selectOne("Newconcert.concert_count")).intValue();	
		 System.out.println("count="+count);
		 
		return count;
	}
	
	/* 게시물 목록 
	public List<BoxMusicBean> getBoardList(int  page)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxMusicBean>  list = session.selectList("Newmusic.Newmusic_list", page);
	    return list;
	}	*/

/*	 게시판 조회수 증가 
	public void NewmusicHit(int board_num) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("Newmusic.Newmusic_hit", board_num);
	}
	*/
	
	/* 게시판 글내용보기 */
	public BoxConcertBean getNewConcertCont(int Id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoxConcertBean) session.selectOne("Newmusic.concert_cont", Id);
	}	

/*	 게시물 수정 
	public void Newmusicedit(BoxMusicBean Newmusicdata) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.update("Newmusic.Newmusic_edit", Newmusicdata);
	}

	 게시물 삭제 
	public void NewmusicDelete(int Id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("Newmusic.Newmusic_del", Id);
	}*/
}
