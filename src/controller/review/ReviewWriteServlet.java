package controller.review;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.ReviewDAO;
import dto.ReviewDTO;


@WebServlet("/reviewwrite.do")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		RequestDispatcher rd = request.getRequestDispatcher("review/reviewwrite.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String savePath = "upload";
		int maxPostSize = 20 * 1024 * 1024;
		String enctype="utf-8";
		
		ServletContext context = getServletContext();
		String path = context.getRealPath(savePath);
		System.out.println("서버상의 업로드 실제 디렉토리 : "+path);
		
		MultipartRequest multi = new MultipartRequest(
				request, //request 객체
				path,  //서버상의 실제 디렉토리
				maxPostSize, //최대 업로드 파일 크기
				enctype, //인코딩
				new DefaultFileRenamePolicy());
		
		String content = multi.getParameter("content");
		String writer = multi.getParameter("writer");
		String title = multi.getParameter("title");
		String imgurl = multi.getFilesystemName("imgurl");

		
		ReviewDTO rdto = new ReviewDTO();
		
		rdto.setContent(content);
		rdto.setWriter(writer);
		rdto.setTitle(title);
		rdto.setImgurl(imgurl);

		
		ReviewDAO rdao = new ReviewDAO();
		
		rdao.reviewInsert(rdto);
		
		response.sendRedirect("review.do");
		
	}

}
