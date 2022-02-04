package controller.news;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CmtDAO;


@WebServlet("/newscmtupdate.do")
public class NewsCmtUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NewsCmtUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		CmtDAO dao = new CmtDAO();
		
		int result = dao.commentCount(bno);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String content = request.getParameter("content");
		
		CmtDAO dao = new CmtDAO();
		
		int result = dao.cmtmodify(num, content);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
