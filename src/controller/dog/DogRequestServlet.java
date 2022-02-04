package controller.dog;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DogDAO;
import dto.DogDTO;

@WebServlet("/dogrequest.do")
public class DogRequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DogRequestServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String bno = request.getParameter("bno");
		
		DogDAO ddao = new DogDAO();
		
		DogDTO ddto = ddao.getDogImage(bno);
		
		request.setAttribute("ddto", ddto);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("dog/dogrequest.jsp");
		rd.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
