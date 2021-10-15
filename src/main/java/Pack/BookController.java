package Pack;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class BookController {
	
	@RequestMapping("/search")
	public String method07(Model model, HttpServletRequest r, HttpServletResponse response, BookDTO bdto) throws Exception {
		
		// 한글처리
		r.setCharacterEncoding("utf-8");
		String keyword = r.getParameter("keyword").trim();		
		String bookInfo = r.getParameter("bookInfo").trim();	
		BookDAO bdao = new BookDAO();
		List booklist = bdao.booklist(bdto);
		
		switch (bookInfo) {
		case "bookWriter":
			booklist = bdao.searchListWriter(bdto, keyword);
			break;
		case "bookName":
			booklist = bdao.searchListName(bdto, keyword);
			break;
		case "bookPublisher":
			booklist = bdao.searchListPublisher(bdto, keyword);
			break;
		}
		
		r.setAttribute("bookList", booklist);
		
		
		return "book/searchResult";
	}	
	
	@RequestMapping("/bookDetail")
	public String bookDetail(HttpServletRequest request, BookDTO bdto, RentalDTO rdto, ReserveDTO rsdto) {
		int bookID = Integer.parseInt(request.getParameter("bookID"));
		System.out.println(bookID);
		BookDAO bdao = new BookDAO();
		Vector totalList = new Vector();
		totalList = bdao.bookDetail(bdto, rdto, rsdto, bookID);
		request.setAttribute("bookList", totalList.get(0));
		request.setAttribute("rentalList", totalList.get(1));
		request.setAttribute("reserveList", totalList.get(2));
		
		return "book/bookDetail";
	}
	
	//////////////////경도ㅓ//////////////////////
	
	@RequestMapping("/A")
	public String method012() {
		
		return "admin/bookInfo";
	}
	@RequestMapping("/B")
	public String method014(HttpServletRequest request) {
		String bookId = request.getParameter("bookID");
		System.out.println(bookId);
		return "admin/bookInfo2";
	}
	@RequestMapping("/C")
	public String method22(Model model, RentalDTO rdto, HttpServletRequest request) {
		String bookId = request.getParameter("bookID");
		System.out.println(bookId);
		String userID = request.getParameter("userID");
		System.out.println(userID);
		String rentalcheck = request.getParameter("rentalcheck");
		System.out.println(rentalcheck);
		String startDate = request.getParameter("startDate");
		System.out.println(startDate);
		String endDate = request.getParameter("endDate");
		System.out.println(endDate);
		
		BookDAO bdao = new BookDAO();
		bdao.rentalInsert(rdto);
		List rentalList = bdao.rentalList(rdto);
		request.setAttribute("rentalList", rentalList);
		
		return "admin/dateCheck";
	}
	@RequestMapping("/goRentalCheck")
	public String method21(Model model, BookDTO bdto, HttpServletRequest request) {
		
		BookDAO bdao = new BookDAO();
		List booklist = bdao.bookRentalList(bdto);
		System.out.println(booklist);
		request.setAttribute("bookList", booklist);
		
		return "admin/rentalCheck";
	}
	
	
	@RequestMapping("/rental")
	public String method20(Model model, UserDTO udto, HttpServletRequest request) {
		
		UserDAO udao = new UserDAO();
		List userList = udao.userList(udto);
		request.setAttribute("userList", userList);
		
		return "admin/userList2";
	}
	
	@RequestMapping("/booklist")
	public String method09(Model model, BookDTO bdto, HttpServletRequest request) {
		
		BookDAO bdao = new BookDAO();
		List booklist = bdao.booklist(bdto);
		request.setAttribute("bookList", booklist);

		return "admin/booklist";
	}
	
	@RequestMapping("/bookDelete")
	public String method10(Model model, BookDTO bdto, HttpServletRequest request){
		BookDAO bdao = new BookDAO();
		bdao.bookDelete(bdto);
		List booklist = bdao.booklist(bdto);
	
		request.setAttribute("bookList", booklist);
		return "admin/booklist";
		
		
	}
	
	@RequestMapping("/bookInsert")
	public String method11(Model model, BookDTO bdto, HttpServletRequest request) {
		
		
		BookDAO bdao = new BookDAO();
		bdao.bookinsert(bdto);
		List booklist = bdao.booklist(bdto);
		request.setAttribute("bookList", booklist);

		return "admin/booklist";
	}
	
	@RequestMapping("/bookUpdate")
	public String method013(Model model, BookDTO bdto, HttpServletRequest request) {
		System.out.println(1);
		BookDAO bdao = new BookDAO();
		System.out.println(bdto);
		bdao.bookUpdate(bdto);
		List booklist = bdao.booklist(bdto);
		request.setAttribute("bookList", booklist);

		return "admin/booklist";
	}
	
	@RequestMapping("/bookSearch")
	public String method014(Model model, BookDTO bdto, RentalDTO rdto, HttpServletRequest request) throws Exception{
		// 한글처리
		request.setCharacterEncoding("utf-8");
		String keyword = request.getParameter("keyword").trim();		
		String bookInfo = request.getParameter("bookInfo").trim();	
		BookDAO bdao = new BookDAO();
		List booklist = bdao.booklist(bdto);
		
		switch (bookInfo) {
		case "bookWriter":
			booklist = bdao.searchListWriter(bdto, keyword);
			break;
		case "bookName":
			booklist = bdao.searchListName(bdto, keyword);
			break;
		case "bookPublisher":
			booklist = bdao.searchListPublisher(bdto, keyword);
			break;
		}
		
		request.setAttribute("bookList", booklist);
		
		
		return "admin/booklist";			
	}
	
	
	
	////////////////////////////////////////////
}
