package kr.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.smhrd.model.CartDAO;
import kr.smhrd.model.UserVO;
import kr.smhrd.model.cartVO;
import kr.smhrd.model.mainDAO;

public class cartInsertController implements Controller {

	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		System.out.println("���� ��ȣ :  "+request.getParameter("user_num"));
		System.out.println("������ ��ȣ :  "+request.getParameter("item_num"));
		System.out.println("īƮ ���� :  "+request.getParameter("cart_cnt"));
		
		
		String str = request.getParameter("user_num");

		int user_num = 0; 

		 


		     user_num = Integer.parseInt(str);

		
		
		
		int item_num=Integer.parseInt(request.getParameter("item_num")); //hidden���� ��������
		int cart_cnt=Integer.parseInt(request.getParameter("cart_cnt"));
		System.out.println("�Ķ���� ��Ʈ������ ��������");
		cartVO vo=new cartVO();
		vo.setUser_num(user_num);
		vo.setItem_num(item_num);
		vo.setCart_cnt(cart_cnt);
		
		CartDAO dao=new CartDAO();
		dao.cartInsert(vo);
		
		return "redirect:/mainPage.do";
	}

}
