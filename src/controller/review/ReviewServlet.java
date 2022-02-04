package controller.review;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDAO;
import dto.ReviewDTO;
import utility.Criteria;
import utility.PageVO;


@WebServlet("/review.do")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String word = "";
		String sel = "";
		String query = "";
		
		int pageNum = 1;
		int amount = 6;
		
		
		if(request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
			amount = Integer.parseInt(request.getParameter("amount"));
		}
		if(request.getParameter("sel") != null && !request.getParameter("word").equals("")) {
			sel = request.getParameter("sel");
			word = request.getParameter("word");
			query = sel + " like '%" + word + "%'"; //title like '%코딩%'
		}
		
		Criteria cri = new Criteria();
		
		cri.setPageNum(pageNum);
		cri.setAmount(amount);
		cri.setType(sel);
		cri.setKeyword(word);
		
		ReviewDAO rdao = new ReviewDAO();
		
		List<ReviewDTO> list = rdao.getListWithPaging(cri, query);
		
		int count = rdao.reviewCount(query);
		
		PageVO pvo = new PageVO(cri, count);
		
		request.setAttribute("reviewList", list);
		request.setAttribute("pageMaker", pvo);
		request.setAttribute("count", count);
		
		RequestDispatcher rd = request.getRequestDispatcher("review/review.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
