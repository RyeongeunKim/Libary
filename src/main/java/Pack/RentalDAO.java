package Pack;

import java.io.InputStream;
import java.util.List;
import java.util.Vector;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class RentalDAO {
	SqlSessionFactory ssf;
	RentalDAO(){
		try {
			InputStream is = Resources.getResourceAsStream("mybatis-config.xml");
			ssf = new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) { e.printStackTrace();}		
	}

	// 대출중도서
	Vector rentaling(RentalDTO rdto, BookDTO bdto, String userID){
	      SqlSession session = ssf.openSession();
	      List<RentalDTO> mm = session.selectList("test08", userID);
	      List<BookDTO> mm2 = session.selectList("test8", userID);
	      Vector total = new Vector();
	      total.add(mm);
	      total.add(mm2);
	      session.close();
	      return total;
	   }

	
	// 대출이력1
	Vector rentalHistory(RentalDTO rdto, BookDTO bdto, String userID){
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

	
	
}
