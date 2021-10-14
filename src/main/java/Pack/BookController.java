package Pack;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BookController {
	
	@RequestMapping("/search")
	public String method07(Model model, HttpServletRequest r, HttpServletResponse response, BookDTO bdto) throws Exception {
		// 한글처리
		r.setCharacterEncoding("utf-8");
		String keyword = r.getParameter("keyword").trim();		
		String bookInfo = r.getParameter("bookInfo").trim();	
		BookDAO bdao = new BookDAO();
		System.out.println(keyword);
		List searchList = null;
		
		switch (bookInfo) {
		case "bookWriter":
			searchList = bdao.searchListWriter(bdto, keyword);
			break;
		case "bookName":
			searchList = bdao.searchListName(bdto, keyword);
			break;
		case "bookPublisher":
			searchList = bdao.searchListPublisher(bdto, keyword);
			break;
		}
		
		r.setAttribute("searchList", searchList);
		return "book/searchResult";
	}	

}
