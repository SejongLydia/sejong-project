package controller.member;

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


@WebServlet("/memberupdate.do")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberDAO mdao = new MemberDAO();
		String id = (String)request.getSession().getAttribute("userid");
		JoinMemberDTO mdto = mdao.memberOneSelect(id);
		
		request.setAttribute("upmember", mdto);
		
		RequestDispatcher rd = request.getRequestDispatcher("member/memberupdate.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		JoinMemberDTO dto = new JoinMemberDTO();
		MemberDAO mdao = new MemberDAO();
		
		
		String sid = (String)request.getSession().getAttribute("userid");
		
		
		dto.setId(request.getParameter("id"));
		if(request.getParameter("pw1") != null) {
			dto.setPw(SecurityPassword.encoding(request.getParameter("pw1")));
		}
		dto.setName(request.getParameter("name"));
		dto.setBirth(request.getParameter("birth1")+request.getParameter("birth2")+request.getParameter("birth3"));
		dto.setGender(request.getParameter("gender"));
		dto.setEmail(request.getParameter("email"));
		dto.setPhone(request.getParameter("phone"));
		mdao.setMemberUpdate(dto);
		
		response.sendRedirect("main.do");
		
		
	}

}
