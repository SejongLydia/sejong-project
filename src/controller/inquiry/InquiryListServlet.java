package controller.inquiry;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.InquiryDAO;
import dao.MainDAO;
import dto.InquiryDTO;
import dto.NewsDTO;


@WebServlet("/inquirylist.do")
public class InquiryListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public InquiryListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String sel="";
		String word="";
		String query="";
		
		if(request.getParameter("sel") != null && !request.getParameter("word").equals("")){
			sel = request.getParameter("sel");
			word = request.getParameter("word");
			query = sel + "like '%" + word + "%'";
		}
		
		InquiryDAO dao = new InquiryDAO();
		MainDAO mdao = new MainDAO();
		
		List<InquiryDTO> list = dao.inquirySelect(query);
		List<NewsDTO> nlist = mdao.getNoticeSelect();
		
		int count = dao.inquiryCount(query);
		
		request.setAttribute("inquiryList", list);
		request.setAttribute("count", count);
		request.setAttribute("newslist", nlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("inquiry/inquirylist.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
