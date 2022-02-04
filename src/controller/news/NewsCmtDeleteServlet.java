package controller.news;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CmtDAO;


@WebServlet("/newscmtdelete.do")
public class NewsCmtDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public NewsCmtDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		CmtDAO dao = new CmtDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = 0;
		
		result = dao.cmtExistCheck(num);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		CmtDAO dao = new CmtDAO();
		
		int num = Integer.parseInt(request.getParameter("num"));
		
		int result = 0;
		
		result = dao.cmtDelete(num);
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

}
