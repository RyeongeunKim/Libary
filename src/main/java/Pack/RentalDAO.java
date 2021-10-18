package Pack;

import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class RentalDAO {
	SqlSessionFactory ssf;

	RentalDAO() {
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 대출중도서
	Vector rentaling(RentalDTO rdto, BookDTO bdto, String userID) {
		SqlSession session = ssf.openSession();
		List<RentalDTO> mm = session.selectList("test08", userID);
		List<BookDTO> mm2 = session.selectList("test8", userID);
		Vector total = new Vector();
		total.add(mm);
		total.add(mm2);
		System.out.println("123124124"+total);
		session.close();
		return total;
	}

	// 대출이력1
	Vector rentalHistory(RentalDTO rdto, BookDTO bdto, String userID) {
		SqlSession session = ssf.openSession();
		List<RentalDTO> mm = session.selectList("test09", userID);
		List<BookDTO> mm2 = session.selectList("test10", userID);
		Vector total = new Vector();
		total.add(mm);
		total.add(mm2);
		System.out.println("토탈==================>" + total);
		session.close();
		return total;
	}

//	// 대출이력2
//	List bookHistory(BookDTO bdto){
//		SqlSession session = ssf.openSession();
//		List<BookDTO> mm = session.selectList("test07");
//		System.out.println(mm);
//		session.close();
//		return mm;
//	}

	// =============================================
	// 반납일 읽어오기
	Date bookReturn(int bIdNum) {
		SqlSession session = ssf.openSession();
		Date bookID = session.selectOne("readDate", bIdNum);
		session.close();
		return bookID;
	}

	// 예약정보 넣기
	void insertReserve(ReserveDTO rdto) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.insert("insertReserve", rdto);
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	// 예약중인지아닌지 bookID 읽어오기
	int Reserved(int reserveBookId) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.selectOne("searchBID", reserveBookId);
			session.close();

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}

	}

	// 로그인한자의 예약중인 책 BookID 리스트 가져오기
	Vector reserveHistory(String userID, BookDTO bdto, ReserveDTO resdto) {
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("selectBID", userID);
		List<ReserveDTO> mm2 = session.selectList("selectresDate", userID);

		Vector total = new Vector();
		total.add(mm);
		total.add(mm2);
		session.close();

		return total;
	}

	// 예약취소
	void resCancel01(int bIdNum) {
		SqlSession session = ssf.openSession();
		try {
			int result = session.delete("resCancel02", bIdNum);
			if (result > 0)
				session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	// ========================================================================

}
