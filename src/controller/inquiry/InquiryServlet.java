package controller.inquiry;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dto.InquiryDTO;


@WebServlet("/inquiry.do")
public class InquiryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public InquiryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("inquiry/inquiryWrite.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		InquiryDTO idto = new InquiryDTO();
		
		idto.setName(request.getParameter("name"));
		idto.setEmail(request.getParameter("email"));
		idto.setCategory(request.getParameter("category"));
		idto.setTitle(request.getParameter("title"));
		idto.setContent(request.getParameter("content"));
		idto.setImgurl(request.getParameter("imgurl"));
		
		InquiryDAO idao = new InquiryDAO();
		
		idao.inquiryInsert(idto);
		
		response.sendRedirect("inquirylist.do");
		
	}

}
