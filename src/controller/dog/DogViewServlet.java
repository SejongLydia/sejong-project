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


@WebServlet("/dogview.do")
public class DogViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DogViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		DogDAO ddao = new DogDAO();
		
		String bno = request.getParameter("bno");
		
		DogDTO ddto = ddao.getDogImage(bno);
		
		request.setAttribute("ddto", ddto);
		
		RequestDispatcher rd = request.getRequestDispatcher("dog/dogview.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
