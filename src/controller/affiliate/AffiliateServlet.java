package controller.affiliate;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MainDAO;
import dto.NewsDTO;


@WebServlet("/affiliate.do")
public class AffiliateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AffiliateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MainDAO dao = new MainDAO();
		List<NewsDTO> nlist = dao.getNoticeSelect();
		
		request.setAttribute("newslist", nlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("affiliate/affiliate.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
