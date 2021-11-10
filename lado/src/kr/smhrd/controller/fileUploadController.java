package kr.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.smhrd.model.boardVO;
import kr.smhrd.model.itemVO;
import kr.smhrd.model.mainDAO;


public class fileUploadController implements Controller {

//	private static final String CHARSET = "utf-8";
	


	
//	private static final String ATTACHES_DIR = "C:\\Users\\smhrd\\git\\repository4\\lado\\WebContent\\WEB-INF\\img";
//	private static final int LIMIT_SIZE_BYTES = 1024*1024;
	
	@Override
	public String requestHandler(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String savePath = request.getRealPath("/img");
		int sizeLimit = 1024*1024*15;
		
		MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		
		String item_name=multi.getParameter("item_name");
		String item_company=multi.getParameter("item_company");
		int item_price=Integer.parseInt(multi.getParameter("item_price"));
		int item_serve=Integer.parseInt(multi.getParameter("item_serve"));
		int item_time=Integer.parseInt(multi.getParameter("item_time"));
		int item_gram=Integer.parseInt(multi.getParameter("item_gram"));
		int seller_num=Integer.parseInt(multi.getParameter("seller_num"));
		String fileName=multi.getFilesystemName("file");
		String m_fileFullPath = "img" + File.separator + fileName;
		

		itemVO vo = new itemVO();
		vo.setItem_name(item_name);
		vo.setItem_company(item_company);
		vo.setItem_price(item_price);
		vo.setItem_serve(item_serve);
		vo.setItem_time(item_time);
		vo.setItem_gram(item_gram);
		vo.setItem_imgurl(m_fileFullPath);
		vo.setSeller_num(seller_num);
		
		mainDAO dao = new mainDAO();
		dao.itemInsert(vo);
		
		
		
//		response.setContentType("text/html; charset=UTF-8");
//		
//        request.setCharacterEncoding("utf-8");
//
//        PrintWriter out = response.getWriter();
//
//        File attachesDir = new File(ATTACHES_DIR);
//        
//        DiskFileItemFactory fileItemFactory = new DiskFileItemFactory(); // ���ε�� ������ ������ ����ҿ� ���õ� Ŭ���� (DiskFileItemFactory)
//        fileItemFactory.setRepository(attachesDir); // ���ε�� ������ ������ ��ġ�� File��ü�� �����ϴ� �޼ҵ�
//        fileItemFactory.setSizeThreshold(LIMIT_SIZE_BYTES); // ����ҿ� �ӽ������� ������ �Ѱ� ũ�⸦ byte ������ �����ϴ� �޼ҵ�
//        ServletFileUpload fileUpload = new ServletFileUpload(fileItemFactory); // http ��û�� ���� httpServletRequest ��ü�κ��� multipart/form-data �������� �Ѿ�� http body �κ��� �ٷ�� ���� ��ȯ���ִ� Ŭ����
//        
//        try {
//			List<FileItem> items = fileUpload.parseRequest(request); //FileItem �̶�� �������� ��ȯ���ִ� �޼ҵ�
//			// FileItem : ����ڰ� ���ε��� File �����ͳ� ����ڰ� input text�� �Է��� �Ϲ� ��û �����Ϳ� ���� ��ü
//			//            isFormField() �޼ҵ��� ���ϰ��� true�̸� text���� �Ϲ� �Է� �������̰�,
//			//            false�̸� ���ϵ������̴�. ��, ���ϰ��� false�� ��쿡�� ������ ���ε�� ������ �����Ͽ� ó���ϸ� ��.
//			for(FileItem item : items) {
//				if(item.isFormField()) { // isFormField() : input�±׿� �Էµ� �����Ͱ� text ���� �ܼ��� �Է°��̸� true, ÷������ ���� ���̳ʸ��������̸� false�� ��ȯ
//					System.out.printf("�Ķ���� �� : %s, �Ķ���� �� : %s \n", item.getFieldName(), item.getString("utf-8"));
//					// getFieldName() : �������� name(input �±׿� ������ name��)�� ����
//					// getString(final String charset) : ÷�������� �ƴ� �ܼ��� form�������� ��� �Էµ� ���� charset�� ���� ���ڵ��Ͽ� ����
//				}else {
//					System.out.printf("�Ķ���� �� : %s, ���� �� : %s, ���� ũ�� : %s bytes \n", item.getFieldName(), item.getName(), item.getSize());
//					// getName() : �����Ͱ� ÷�������� ��� ���ϸ� �Ǵ� ���� ��θ� ����
//					// getSize() : �������� ũ��(������ ũ��)�� byte ������ ����
//					if(item.getSize()>0) {
//						String separator = File.separator; // File.separator : �ü������ �ٸ� ���ϰ�� �����ڸ� ����(windows�� ��� \)
//						int index= item.getName().lastIndexOf(separator);
//						String fileName= item.getName().substring(index+1);
//						File uploadFile = new File(ATTACHES_DIR + separator + fileName);
//						
//						item.write(uploadFile);
//						// write(File file) throw Exception : ���� �����Ͱ� ÷�������� �� �Űܺ����� �Ѱ��� file ��ü�� ��η� ���(����)
//					}
//				}
//			}
//			
//			
//        	out.println("<h1>���� ���ε� �Ϸ�</h1>");
//			
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//			out.println("<h1>���� ���ε� �� ������ �߻��Ͽ����ϴ�.</h1>");
//		}
		
		
		
		return "inputIngredient";
	}

}
