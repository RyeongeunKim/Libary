package Pack;

import java.io.InputStream;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class UserDAO {
	SqlSessionFactory ssf;

	UserDAO() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	int login(UserDTO udto) {

		SqlSession session = ssf.openSession();
		int check = -1;
		List<String> userPwd = session.selectList("test01", udto);
		if (userPwd.size() == 1) {
			check = 1;
		} else {
			check = 0;
		}
		session.close();
		return check;
	}

	void insert(UserDTO udto) {

		SqlSession session = ssf.openSession();
		try {
			int result = session.insert("test03", udto);
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	int idCheck(String userID) {

		SqlSession session = ssf.openSession();
		int check = 0;
		List<String> mm = session.selectList("test02", userID);
		System.out.println(mm.size());
		if (mm.size() > 0) {
			check = 1; // 아이디 있음 사용X
		} else {
			check = 0; // 아이디 없음 사용O
		}
		session.close();
		return check;
	}

	List userList(UserDTO udto) {

		SqlSession session = ssf.openSession();
		List<UserDTO> mm = session.selectList("test04");
		session.close();
		return mm;
	}

//	======================================================================
	public UserDTO userDataRead(String userID) {
		SqlSession session = ssf.openSession();
		UserDTO ud = null;
//		System.out.println(udto.getUserID());

		try {
			ud = session.selectOne("userData", userID);
			System.out.println(ud);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return ud;
	}

	public UserDTO userPwdData(String userID) { // 비밀번호 재확인
		SqlSession session = ssf.openSession();
		UserDTO ud = null;
//		System.out.println(udto.getUserID());

		try {
			ud = session.selectOne("userData", userID);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return ud;
	}

	void userUpdate(UserDTO udto, String userID) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.update("userUpdate", udto);
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	void deleteUser(String userID) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.delete("userDelete", userID);
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
//	===================================================================

	//////////////////////////// 경도///////////////////////////////////

	// 회원정보 삭제하기
	void userInfoDelete(UserDTO udto) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.delete("userInfoDelete", udto.getUserID());
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// 회원정보 수정하기
	void userInfoUpdate(UserDTO udto) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.update("userInfoUpdate", udto);
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	// 회원 개인 정보
	List userPrivacy(UserDTO udto) {
		SqlSession session = ssf.openSession();
		List<UserDTO> mm = session.selectList("userPrivacy", udto);
		session.close();
		return mm;
	}

}
