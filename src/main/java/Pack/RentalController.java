package Pack;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController {

	// 대출중도서
	@RequestMapping("/myLibrary")
	public String method02(Model model, RentalDTO rdto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");

		RentalDAO rdao = new RentalDAO();
		List rentaling = rdao.rentaling(rdto, userID);

		request.setAttribute("rentaling", rentaling);

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

		

		return "rental/rentalHistory";
	}
	
	
}
