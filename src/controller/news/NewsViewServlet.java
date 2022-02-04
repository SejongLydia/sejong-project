package controller.news;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CmtDAO;
import dao.NewsDAO;
import dto.CmtDTO;
import dto.NewsDTO;


@WebServlet("/newsview.do")
public class NewsViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public NewsViewServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//겟으로 넘어왔으니까 이곳에 코딩
				int bno = Integer.parseInt(request.getParameter("bno")); //브라우저에서 넘어오는 값
				
				NewsDAO dao = new NewsDAO();
				CmtDAO cdao = new CmtDAO();
				
				NewsDTO dto = dao.newsView(bno);
				List<CmtDTO> clist = cdao.selectCmt(bno); 
				
				int cmtcnt = cdao.commentCount(bno);
				
				request.setAttribute("view", dto); //속성에 담기
				request.setAttribute("clist", clist);
				request.setAttribute("cmtcnt", cmtcnt);
				
				RequestDispatcher rd = request.getRequestDispatcher("news/newsview.jsp"); //포워딩
				rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
