package Pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserController {
	
	@RequestMapping("/login")
	public String method01() {
		return "user/login";
	}
	
	@RequestMapping("/join")
	public String method02() {
		return "user/join";
	}
	
	@RequestMapping("/main")
	public String method03() {
		return "main";
	}
	
	/////////////////////////
	
//	@RequestMapping("/myLibrary")
//	public String myLibrary() {
//		return "user/myLibrary";
//	}
	
	@RequestMapping("/reEnter")
	public String reEnter() {
		return "user/rePassword";
	}
	
	
	
	////////////////////////////////////
	
	
	
	@RequestMapping("/loginGo")
	public String method04(Model model, UserDTO udto, 
			HttpServletRequest r, HttpServletResponse response) {
		UserDAO udao = new UserDAO();
		int check = udao.login(udto);
		if(check == 0) {
			try {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				
				out.print("<script>");
				out.print(" alert('아이디나 비밀번호가 틀렸습니다'); ");
				out.print(" history.go(-1); ");
				out.print("</script>");
				
				out.close();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			
		}
		
		// 아이디 정보를 session객체에 저장
		HttpSession session = r.getSession();
		session.setAttribute("userID", udto.getUserID());
		
		// 페이지 이동
		return "main";
	}
	
	@RequestMapping("/logout")
	public void method05(HttpServletRequest r, HttpServletResponse response) {
		// 로그아웃 처리 -> 로그인 세션을 초기화(삭제)
		HttpSession session = r.getSession();
		session.invalidate();
		
		// 페이지 이동(js 사용)
		response.setContentType("text/html; charset=UTF-8");
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>");
			out.print(" alert('로그아웃 하였습니다.');");
			out.print(" location.href='./';");
			out.print("</script>");
			out.close();	
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/idcheck")
	public String method07(HttpServletRequest r, HttpServletResponse response) throws Exception {
		// 한글처리
		r.setCharacterEncoding("utf-8");
		String userID = r.getParameter("userID").trim();
		
		System.out.println("ajax id 전송 : " + userID);
		
		UserDAO udao = new UserDAO();
		
		int check = 0;
		
		if(userID != null) {
			check = udao.idCheck(userID);
		}
		
		System.out.println(check);
		
		PrintWriter out = response.getWriter();
		
		out.print(check);
		out.flush();
		out.close();
		
		return null;
	}	

	@RequestMapping("/joinResult")
	public String method06(Model model, UserDTO udto) {
		System.out.println(udto + "컨트롤러");
		UserDAO udao = new UserDAO();
		udao.insert(udto);
		return "user/login";
	}
	
	@RequestMapping("/userList")
	public String method08(Model model, UserDTO udto, HttpServletRequest request) {

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("userID");
		
		if(userID == null || !userID.equals("admin")){
			return "user/login";
		} 
		
		UserDAO udao = new UserDAO();
		List userList = udao.userList(udto);
		request.setAttribute("userList", userList);
		
		return "admin/userList";
	}
	
	@RequestMapping("/jusoPopup")
	public String method09() {
		return "user/jusoPopup";
	}
	
	
	//////////////////////////////////////////
	
	@RequestMapping("/userRead") // 회원 정보읽어오기
	public String userDataRead(Model model, HttpServletRequest req, UserDTO udto) {
		System.out.println(1);
		HttpSession session = req.getSession();
		String userID = (String) session.getAttribute("userID");
		
		
		UserDAO udao = new UserDAO();
		udto = udao.userDataRead(userID); 
		
		model.addAttribute("userData", udto); 
		
		return "user/userUpdateForm";
	}
	
	@RequestMapping("/reConfirm") // 비밀번호 재확인
	public void reConfirm(Model model, UserDTO udto, HttpServletRequest req, HttpServletResponse response) {
		System.out.println(5);
		HttpSession session = req.getSession();
		String userID = (String) session.getAttribute("userID");
		
		UserDAO udao = new UserDAO();
		udto = udao.userPwdData(userID); 
		
		String originPW = udto.getUserPwd(); // db값
		String rePW = req.getParameter("userPwd"); // 입력값 
		
		response.setContentType("text/html; charset=utf-8");
			PrintWriter out;
			try {
				out = response.getWriter();

				if(originPW.equals(rePW)) {
					out.print("<script>");
					out.print("location.href='userRead';");//정보수정 이동
					out.print("</script>");
				}else { // 틀렷습니다 팝업창
					out.print("<script>");
					out.print(" alert('비밀번호가 맞지 않습니다');");
					out.print("location.href=' ./';");
					out.print("</script>");
					out.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}

	}
	
	
	@RequestMapping("/userUpdate") // 회원 정보 수정
	public String userUpdate(HttpServletRequest req, UserDTO udto) {
		System.out.println(2);
		//HttpSession session = req.getSession();
		//String userID = (String) session.getAttribute("userID");
		String userID = req.getParameter("userID");
		UserDAO udao = new UserDAO();
		udto = udao.userDataRead(userID); 
		System.out.println(userID);
		
		String sPw = udto.getUserPwd(); 
		String sPw01 = req.getParameter("userPwd"); 
		
		if(!sPw.equals(sPw01)) { 
			udto.setUserPwd(sPw01);
		}
		udto.setUserName(req.getParameter("userName"));
		udto.setUserAge(Integer.parseInt(req.getParameter("userAge")));
		udto.setUserPhone(req.getParameter("userPhone"));
		udto.setUserAddress(req.getParameter("userAddress"));
		
		udao.userUpdate(udto,userID);
		
		return "main";
	}
	
	
	
	@RequestMapping("/deleteUser") // 회원 탈퇴
	public String userDelete(HttpServletRequest req, UserDTO udto) {
		System.out.println(3);
		HttpSession session = req.getSession();
		String userID = (String) session.getAttribute("userID");
		System.out.println(userID);
		try {
			UserDAO udao = new UserDAO();
			udao.deleteUser(userID);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.invalidate();
		}
		return "main";
	}
	
	
	///////////////////////ㄱㄷ////////////////////////////////
	
	
	//회원정보 삭제하기
	@RequestMapping("/userInfoDelete")
	public String userInfoDelete(Model model, UserDTO udto, HttpServletRequest request){
		UserDAO udao = new UserDAO();
		udao.userInfoDelete(udto);
		List userList = udao.userList(udto);
	
		request.setAttribute("userList", userList);
		return "admin/userList";
	}
	
	//회원정보 수정 페이지 이동하기
	@RequestMapping("/userPrivacy")
	public String userPrivacy(Model model, UserDTO udto, HttpServletRequest request){
		UserDAO udao = new UserDAO();
		List userPrivacy = udao.userPrivacy(udto);
		request.setAttribute("userPrivacy", userPrivacy);
		System.out.println(userPrivacy);
		return "admin/userInfoUpdate";
	}
	
	//회원정보 수정하기
	@RequestMapping("/userInfoUpdate")
	public String userInfoUpdate(Model model, UserDTO udto, HttpServletRequest request) {
		UserDAO udao = new UserDAO();
		System.out.println(udto);
		udao.userInfoUpdate(udto);
		List userList = udao.userList(udto);
		request.setAttribute("userList", userList);

		return "admin/userList";
	}

}
