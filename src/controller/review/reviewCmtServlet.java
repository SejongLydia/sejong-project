package controller.review;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.CmtDAO;
import dto.CmtDTO;


@WebServlet("/reviewcmt.do")
public class reviewCmtServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public reviewCmtServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json; charset=utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		CmtDAO cdao = new CmtDAO();
		
		List<CmtDTO> clist = cdao.selectCmt(bno);
		
		Gson gson = new Gson();
		String cmtList = gson.toJson(clist);
		
		PrintWriter out = response.getWriter();
		
		out.print(cmtList);
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		CmtDTO cvo = new CmtDTO();
		cvo.setBno(bno);
		cvo.setWriter(writer);
		cvo.setContent(content);
		
		CmtDAO cdao = new CmtDAO();
		
		int result = cdao.cmtInsert(cvo);
		
		response.setContentType("application/x-json; charset=utf-8");
		
		PrintWriter out = response.getWriter();
		out.print(result);
		
		
	}

}
