package controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CmtDAO;
import dao.ReviewDAO;
import dto.CmtDTO;
import dto.ReviewDTO;
import utility.Criteria;


@WebServlet("/reviewview.do")
public class ReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewViewServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno")); //브라우저에서 넘어오는 값
		
		ReviewDAO rdao = new ReviewDAO();
		CmtDAO cdao = new CmtDAO();
		
		ReviewDTO rdto = rdao.reviewView(bno);
		List<CmtDTO> clist = cdao.selectCmt(bno);
		
		int cmtcnt = cdao.commentCount(bno);
		
		request.setAttribute("view", rdto); //속성에 담기
		request.setAttribute("cmtList", clist);
		request.setAttribute("cmtcnt", cmtcnt);
		
		RequestDispatcher rd = request.getRequestDispatcher("review/reviewview.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
