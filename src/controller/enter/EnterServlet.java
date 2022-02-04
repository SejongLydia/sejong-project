package controller.enter;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.EnterDAO;
import dao.MainDAO;
import dto.EnterDTO;
import dto.NewsDTO;


@WebServlet("/enter.do")
public class EnterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EnterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		EnterDAO edao = new EnterDAO();
		
		
		List<EnterDTO> list = edao.enterSelect();
		
		request.setAttribute("enterList", list);
		
		RequestDispatcher rd = request.getRequestDispatcher("enter/enter.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
