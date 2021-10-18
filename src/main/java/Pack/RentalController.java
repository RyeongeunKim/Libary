package Pack;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController {

	// 대출중도서
	@RequestMapping("/myLibrary")
	public String method02(Model model, RentalDTO rdto, BookDTO bdto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");

		RentalDAO rdao = new RentalDAO();

		Vector totalList = new Vector();
		totalList = rdao.rentaling(rdto, bdto, userID);

		request.setAttribute("rentalList", totalList.get(0));
		request.setAttribute("bookList", totalList.get(1));

		return "rental/myLibrary";
	}

	// 대출이력
	@RequestMapping("/rentalHistory")
	public String method03(Model model, RentalDTO rdto, BookDTO bdto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");

		RentalDAO rdao = new RentalDAO();

		Vector totalList = new Vector();
		totalList = rdao.rentalHistory(rdto, bdto, userID);

//		List rentalHistory = rdao.rentalHistory(rdto, userID);
//		List bookHistory = rdao.bookHistory(bdto);
//		totalList.add(rentalHistory);
//		totalList.add(bookHistory);

		request.setAttribute("rentalList", totalList.get(0));
		request.setAttribute("bookList", totalList.get(1));
		System.out.println(totalList);
		return "rental/rentalHistory";
	}

//	=========================================

	// 회원정보 + 책정보 + 예약가능일 가져오기
	@RequestMapping("reReserve")
	public String reserve(Model model, HttpServletRequest req, UserDTO udto, BookDTO bdto) {
		HttpSession session = req.getSession();
		RentalDAO rdao = new RentalDAO();
		int bIdNum = Integer.parseInt(req.getParameter("bookID"));
		Date rtDate = rdao.bookReturn(bIdNum);
		System.out.println("sss" + rtDate);
		String bn = req.getParameter("bookName");
		model.addAttribute("bn", bn);

		Calendar c = Calendar.getInstance();
		c.setTime(rtDate);
		c.add(Calendar.DATE, 1);
		rtDate = c.getTime();
		System.out.println(c);
		
		Date from = new Date();

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");

		String to = transFormat.format(from);
		System.out.println(to);



		model.addAttribute("rtDate1", rtDate);
		model.addAttribute("rtDate", to);
		model.addAttribute("bIdNum", bIdNum);

		return "rental/reservation";
	}

	// 예약정보 가져와서 넣어주기
	@RequestMapping("reserveData")
	public void reserveData(HttpServletRequest req, ReserveDTO rdto, HttpServletResponse response) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out;

		HttpSession session = req.getSession();
		String userID = (String) session.getAttribute("userID");

		int reserveBookId = Integer.parseInt(req.getParameter("bIdNum"));

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date;
		try {
			date = format.parse(req.getParameter("returnDate"));
			rdto.setReserveDate(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		rdto.setReserveUserID(userID);
		rdto.setReserveBookID(reserveBookId);

		RentalDAO rdao = new RentalDAO();

		// 예약중복확인
		int returnBID = rdao.Reserved(reserveBookId);
		System.out.println(returnBID);
		response.setContentType("text/html; charset=utf-8");
		if (returnBID == 1) {
			try {
				System.out.print("이미 예약중");
				out = response.getWriter();
				out.print("<script>");
				out.print(" alert('이미 예약중인 책입니다.');");
				out.print("window.close();");
				out.print("</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				System.out.print("예약완료");
				out = response.getWriter();
				out.print("<script>");
				out.print(" alert('예약이 완료되었습니다');");
				out.print("window.close();");
				out.print("</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
			rdao.insertReserve(rdto);
		}
	}

	// 예약목록 확인
	@RequestMapping("reserveList")
	public String reserveList(Model model, BookDTO bdto, ReserveDTO resdto, HttpServletRequest req) {
		HttpSession session = req.getSession();
		String userID = (String) session.getAttribute("userID");
		RentalDAO rdao = new RentalDAO();
		/////////////

		// 로그인되있는 사람의 예약중인 booID의 제목 + 저자 + 예약일 가져오기
		Vector totalList = new Vector(); // 예약중인 책아이디 담을 리스트
		totalList = rdao.reserveHistory(userID, bdto, resdto);

		req.setAttribute("bookList", totalList.get(0)); // 리스트에 담겠다
		req.setAttribute("reserveList", totalList.get(1));

		// 반납예정일

		return "rental/reserList";
	}

	// 예약취소
	@RequestMapping("resCancel")
	public void resCancel(HttpServletRequest req, HttpServletResponse res, BookDTO bdto, ReserveDTO resdto) {
		HttpSession session = req.getSession();
		String userID = (String) session.getAttribute("userID");
		int bIdNum = Integer.parseInt(req.getParameter("bookID"));

		RentalDAO rdao = new RentalDAO();
		rdao.resCancel01(bIdNum);

		res.setContentType("text/html; charset=utf-8");
		PrintWriter out;
		/////////////

		// 로그인되있는 사람의 예약중인 booID의 제목 + 저자 + 예약일 가져오기
		Vector totalList = new Vector(); // 예약중인 책아이디 담을 리스트
		totalList = rdao.reserveHistory(userID, bdto, resdto);

		req.setAttribute("bookList", totalList.get(0)); // 리스트에 담겠다
		req.setAttribute("reserveList", totalList.get(1));

		try {
			out = res.getWriter();
			out.print("<script>");
			out.print(" alert('예약이 취소되었습니다');");
			out.print(" location.href='reserveList';");
			out.print("</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

//	=============================================	
}
