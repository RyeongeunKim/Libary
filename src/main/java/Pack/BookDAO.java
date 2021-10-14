package Pack;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

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
}
