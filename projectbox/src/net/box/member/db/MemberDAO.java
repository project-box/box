package net.box.member.db;

import java.io.IOException;
import java.io.Reader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO {
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

//	public int isMember(MemberBean member) {
//	
//		return 1;
//	}
		

	// 회원가입처리
	public int insert(MemberBean member) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSession();
			result = (int) session.insert("member.user_insert", member);
			// return ����� object -> integer�� ��ȯ
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	/* ID 중복검사 */
	public int idCheck(String id) {
		int result = -1;
		SqlSession session = null;
		try {
			session = getSession();
			MemberBean mem = (MemberBean) session.selectOne("select", id);
			if (mem.getId().equals(id)) {
				result = 1;
			}
		} catch (
				Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	/* 비밀번호 변경 */
	public int userPassResetCheck(String password) {
		int result = -1;
		SqlSession session = null;
		try {
			session = getSession();
			MemberBean mem = (MemberBean) session.selectOne("password", password);
			if (mem.getPassword().equals(password)) {
				result = 1;
			}
		} catch (
				Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}
	
	
	
	public MemberBean select(String id) throws SQLException {
		MemberBean mem = null;
		SqlSession session = null;
		try {
			session = getSession();
			mem = (MemberBean) session.selectOne("select", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return mem;
	}

	public List<MemberBean> list() {
		List<MemberBean> list = new ArrayList<MemberBean>();
		SqlSession session = null;
		try {
			session = getSession();
			list = session.selectList("list");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return list;
	}

	public int delete(String id) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSession();
			result = session.delete("delete", id);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

	public int update(MemberBean mem) {
		int result = 0;
		SqlSession session = null;
		try {
			session = getSession();
			result = session.update("update", mem);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return result;
	}

}