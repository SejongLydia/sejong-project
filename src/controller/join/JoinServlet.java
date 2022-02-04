package controller.join;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDAO;
import dto.JoinMemberDTO;
import utility.SecurityPassword;


@WebServlet("/join.do")
public class JoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public JoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("join/join.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//요청
		request.setCharacterEncoding("utf-8");
		//DTO set
		JoinMemberDTO dto = new JoinMemberDTO();
		MemberDAO dao = new MemberDAO();
		
		dto.setId(request.getParameter("id"));
		dto.setPw(SecurityPassword.encoding(request.getParameter("pw1")));
		dto.setName(request.getParameter("name"));
		dto.setBirth(request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3"));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
		
		dao.memberJoin(dto);
		
		response.sendRedirect("main.do");
		
		
		
	}

}
