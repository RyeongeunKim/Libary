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
	
	Vector booklist1(BookDTO bdto, RentalDTO rdto){
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test011");
		List<RentalDTO> mm2 = session.selectList("test012");
		Vector total = new Vector();
	      total.add(mm);
	      total.add(mm2);
	      session.close();
	      return total;
	}
	
	List booklist(BookDTO bdto){
		SqlSession session = ssf.openSession();
		List<BookDTO> mm = session.selectList("test11");
		return mm;
	}
	
	List bookListKey(BookDTO bdto){
		SqlSession session = ssf.openSession();
		
		List<BookDTO> mm = session.selectList("test24");
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
	
	List rentalListKey(RentalDTO rdto){
		SqlSession session = ssf.openSession();

		List<BookDTO> mm = session.selectList("test25");

		return mm;
	}
	
	void bookCheck(BookDTO adto){
		SqlSession session = ssf.openSession();
		try {
			int result = session.update("test19", adto);
			if(result > 0) session.commit(); 
			} catch (Exception e) { e.printStackTrace();
			} finally { session.close(); }
	}
	
	Vector rentaling(RentalDTO rdto, BookDTO bdto, String userID2){
	      SqlSession session = ssf.openSession();
	      List<RentalDTO> mm = session.selectList("test20", userID2);
	      List<BookDTO> mm2 = session.selectList("test21", userID2);
	      Vector total = new Vector();
	      total.add(mm);
	      total.add(mm2);
	      System.out.println(total);
	      session.close();
	      return total;
	   }

	void returnBookKey(BookDTO adto){
		SqlSession session = ssf.openSession();
		try {
			int result = session.update("test22", adto);
			if(result > 0) session.commit(); 
			} catch (Exception e) { e.printStackTrace();
			} finally { session.close(); }
	}
	
	void returnRentalKey(RentalDTO rdto){
		SqlSession session = ssf.openSession();
		try {
			int result = session.update("test23", rdto);
			if(result > 0) session.commit(); 
			} catch (Exception e) { e.printStackTrace();
			} finally { session.close(); }
	}
	
	
	////////////////경도//////////////
	
	
	
	
	
	
	
	
	
	
	
}
