package kr.smhrd.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import kr.smhrd.controller.Controller;

@WebServlet("*.do")
public class MainController extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); // utf-8 ->post���		
		// 1. Ŭ���̾�Ʈ�� ��û�� Ȯ��
		String reqURL=request.getRequestURI();
		String cpath=request.getContextPath(); // /m02
		String command=reqURL.substring(cpath.length());
		
		System.out.println(command);
		
		// 2. command�� ���� �б��۾�(if~ else if ~)
		Controller controller=null;
		String view=null;
		
		
		// 2. HandlerMapping(�ڵ鷯����)
		HandlerMapping mapping=new HandlerMapping();
		
		controller=mapping.getController(command);
		
		view=controller.requestHandler(request, response);
		
		
		// 3. �б��۾��� �ѹ��� �ϱ�.... if
		if(view!=null) 	{
			if(view.indexOf("redirect:")!=-1) {
			   //                    "/m02/boardList.do"	
			   response.sendRedirect(cpath+view.split(":")[1]); // redirect:/boardList.do
			}else if(view.indexOf("data:")!=-1) {
				   //                    "/m02/boardList.do"	
				PrintWriter out = response.getWriter();
				out.print(view.split(":")[1]);
				   //response.sendRedirect(cpath+view.split(":")[1]); // redirect:/boardList.do
				}
			else {
			   //                           "boardList"->"/WEB-INF/board/boardList.jsp"	
			   RequestDispatcher rd=request.getRequestDispatcher(ViewResolver.makeViewUrl(view));
			   rd.forward(request, response); // View(JSP)
			}//
		}//
	
	}

}