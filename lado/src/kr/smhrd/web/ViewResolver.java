package kr.smhrd.web;

public class ViewResolver {
	
	private ViewResolver() {   } // ����Ʈ������
	
    // "boardList"->"/WEB-INF/board/boardList.jsp"	
	public static String makeViewUrl(String view) {
		//Math m=new Math(); // private Math(){   }
		//System sys=new System(); // private System() {    }
		//System.
		return "/WEB-INF/web/"+view+".jsp";
	}	
}

