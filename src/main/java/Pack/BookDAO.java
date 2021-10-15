package Pack;

import java.io.InputStream;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class BookDAO {
	SqlSessionFactory ssf;
	BookDAO(){
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) { e.printStackTrace();}		
	}
	
	List searchListWriter(BookDTO bdto, String keyword) {
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test05", keyword);
		session.close();
		return mm;
	}
	
	List searchListName(BookDTO bdto, String keyword) {
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test06", keyword);
		session.close();
		return mm;
	}
	
	List searchListPublisher(BookDTO bdto, String keyword) {
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test07", keyword);
		session.close();
		return mm;
	}
	
	Vector bookDetail(BookDTO bdto, RentalDTO rdto,ReserveDTO rsdto,int bookID) {
		SqlSession session = ssf.openSession();
		List<BookDTO> mm1 = session.selectList("bookList", bookID);
		List<RentalDTO> mm2 = session.selectList("rentalList", bookID);		
		List<ReserveDTO> mm3 = session.selectList("reserveList", bookID);		
		Vector total = new Vector();
		total.add(mm1);
		total.add(mm2);
		total.add(mm3);
		session.close();
		return total;
	}
	
	
	/////////////경도///////////////
	
	List booklist(BookDTO bdto){
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test11");
		return mm;
	}
	
	List bookRentalList(BookDTO bdto){
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test16", bdto);
		System.out.println(mm);
		return mm;
	}
	
	void bookDelete(BookDTO bdto) {	
		SqlSession session = ssf.openSession();
		System.out.println(bdto);
		try {
			int result = session.delete("test12", bdto);
			if(result > 0)	session.commit();
		} catch (Exception e) {	e.printStackTrace();
		} finally {	session.close();}	
	}
	
	
	void bookinsert(BookDTO bdto){
		SqlSession session = ssf.openSession();
		try {
			int result = session.insert("test13", bdto);
			if(result > 0) session.commit(); 
			} catch (Exception e) { e.printStackTrace();
			} finally { session.close(); }
	}
	
	void bookUpdate(BookDTO bdto){
		SqlSession session = ssf.openSession();
		try {
			int result = session.update("test14", bdto);
			if(result > 0) session.commit(); 
			} catch (Exception e) { e.printStackTrace();
			} finally { session.close(); }
	}
	
	List<BookDTO> bookSearch(BookDTO bdto){
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test15",bdto);
		System.out.println(2);
		System.out.println(mm);
		return mm;
	}
	
	void rentalInsert(RentalDTO rdto){
		
		SqlSession session = ssf.openSession();
		try {
			int result = session.insert("test17", rdto);
			if(result > 0) session.commit(); 
			} catch (Exception e) { e.printStackTrace();
			} finally { session.close(); }
	}
	
	List rentalList(RentalDTO rdto){
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test18");
		return mm;
	}
	
	
	////////////////경도//////////////
	
	
	
	
	
	
	
	
	
	
	
}
