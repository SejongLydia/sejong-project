package controller.login;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MainDAO;
import dao.MemberDAO;
import dto.NewsDTO;
import utility.SecurityPassword;


@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberDAO mdao = new MemberDAO();
		
		MainDAO dao = new MainDAO();
		List<NewsDTO> nlist = dao.getNoticeSelect();
		
		HttpSession session = request.getSession();
		session.setAttribute("footernews", nlist);
		
		//request.setAttribute("newslist", nlist);
		
		RequestDispatcher rd = request.getRequestDispatcher("login/login.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = SecurityPassword.encoding(request.getParameter("pw"));
		
		MemberDAO mdao = new MemberDAO();
		
		
		
		
		
		int result = mdao.memberIdPwCheck(id, pw);
		
		HttpSession session = request.getSession();
		
		String url = "";
		
		if(result == 1) {
			session.setAttribute("userid", id);
			response.sendRedirect("main.do");
		}else if(result == 0) {
			request.setAttribute("msg", "아이디 또는 비밀번호를 확인하세요");
			
		
			RequestDispatcher rd = request.getRequestDispatcher("login/login.jsp");
			rd.forward(request, response);
		}else if(result == -1) {
			request.setAttribute("msg", "회원가입 후 로그인 하세요");
			
			RequestDispatcher rd = request.getRequestDispatcher("join/join.jsp");
			rd.forward(request, response);
		}
		
			}

}
