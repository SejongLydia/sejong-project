package controller.news;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.NewsDAO;
import dto.NewsDTO;

/**
 * Servlet implementation class NewsWritePro
 */
@WebServlet("/newswritepro.do")
public class NewsWritePro extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NewsWritePro() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		NewsDTO ndto = new NewsDTO();
		
		ndto.setName(request.getParameter("name"));
		ndto.setTitle(request.getParameter("subject"));
		ndto.setContent(request.getParameter("message"));
		
		NewsDAO ndao = new NewsDAO();
		
		ndao.newsInsert(ndto);
		
		response.sendRedirect("news.do");
	}

}
