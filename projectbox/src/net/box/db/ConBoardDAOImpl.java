package net.box.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ConBoardDAOImpl {
	
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
	
	/* �ı� ���� */
	public void conboardInsert(ConBoardBean conboard) {
		SqlSession session=null;
		int result = 0;		
		try{
			session = getSession(); 
			System.out.println("insert");			
			System.out.println("id="+conboard.getId());
			System.out.println("concertid="+conboard.getConcertid());
			System.out.println("userid="+conboard.getUserid());
			System.out.println("content="+conboard.getContent());
			System.out.println("registerdate="+conboard.getRegisterdate());			
						
			result=session.insert("conboard.conboard_insert", conboard);
			System.out.println("result="+result);
		}catch(Exception e){
			System.out.println("result="+result);
			System.out.println(e.getMessage());
		}		
	}	
	
	
	/* �� �ı� �� */
	public int getListCount(int id) throws SQLException {
		int count = 0;
		SqlSession session=null;
		session = getSession();
		count = ((Integer) session.selectOne("conboard.conboard_count",id)).intValue();	
		
		return count;
	}
	
	
	/* �ı� ��� */
	public List<ConBoardBean> getConBoardList(int page, int id)	throws SQLException {
		SqlSession session=null;
		session = getSession();
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("page",page);
		map.put("id", id);		
		List<ConBoardBean> list = session.selectList("conboard.conboard_list", map);
	    return list;
	}
	
	
	/* �ı� ���뺸�� */
	public ConBoardBean getConBoardCont(int id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		return (ConBoardBean) session.selectOne("conboard.conboard_cont", id);
	}	
	
	
	/* �ı� ���� */
	public void conboardDelete(int id) throws SQLException {
		SqlSession session=null;
		session = getSession();
		session.delete("conboard.conboard_del", id);
	}
	
}
