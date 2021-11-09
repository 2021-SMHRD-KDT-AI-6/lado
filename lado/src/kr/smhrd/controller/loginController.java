package kr.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.smhrd.model.mainDAO;
import kr.smhrd.model.sellerVO;
import kr.smhrd.model.UserVO;

public class loginController implements Controller  {
	
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String user_id=request.getParameter("user_id");
		String user_pwd=request.getParameter("user_pwd");
		UserVO vo=new UserVO();
		
		String seller_id=request.getParameter("seller_id");
		String seller_pwd=request.getParameter("seller_pwd");
		sellerVO vo2=new sellerVO();
		
		vo.setUser_id(user_id);
		vo.setUser_pwd(user_pwd);
		
		vo2.setSeller_id(seller_id);
		vo2.setSeller_pwd(seller_pwd);
		// userDAO -> mainDAO
		mainDAO dao=new mainDAO();
		UserVO succ=dao.login_user(vo);
		mainDAO dao2=new mainDAO();
		sellerVO succ2=dao2.login_seller(vo2);
		
		if(succ!=null) { // �α��� ���� -> �α��� �����ߴٴ� ǥ�ø� �޸�(����)�� �صξ�� �Ѵ�.
			HttpSession session=request.getSession();
			session.setAttribute("succ", succ);
		}
		if(succ2!=null) { // �α��� ���� -> �α��� �����ߴٴ� ǥ�ø� �޸�(����)�� �صξ�� �Ѵ�.
			HttpSession session=request.getSession();
			session.setAttribute("succ2", succ2);
		}
				
		return "redirect:/mainPage.do";
	}

}
