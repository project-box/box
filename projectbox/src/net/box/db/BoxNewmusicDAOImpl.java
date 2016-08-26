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

public class BoxNewmusicDAOImpl {
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
	public List<BoxMusicBean> getNewmusicList(int page) throws SQLException {
		SqlSession session=null;
		session = getSession();
		List<BoxMusicBean>  list = session.selectList("Newmusic.music_list",page);
		System.out.println("list="+list);
		
	    return list;
	}
	
	/* 게시판 저장 */
	public void NewmusicInsert(BoxMusicBean musicBeen) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert1");
			
			System.out.println("Title="+musicBeen.getTitle());
			System.out.println("Artist="+musicBeen.getArtist());
			System.out.println("similarity="+musicBeen.getSimilarity());
			System.out.println("Genre="+musicBeen.getGenre());
			System.out.println("Publishdate="+musicBeen.getPublishdate());
			System.out.println("Album="+musicBeen.getAlbum());
			System.out.println("lyrics="+musicBeen.getLyrics());
			System.out.println("Albumcoverfilepath="+musicBeen.getAlbumcoverfilepath());			
			
			result=session.insert("Newmusic.music_insert", musicBeen);
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
		count = ((Integer) session.selectOne("Newmusic.music_count")).intValue();	
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
	public BoxMusicBean getNewmusicCont(int Id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (BoxMusicBean) session.selectOne("Newmusic.music_cont", Id);
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
