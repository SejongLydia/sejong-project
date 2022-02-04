package controller.news;

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

import dao.NewsDAO;
import dto.NewsDTO;


@WebServlet("/newsmodify.do")
public class NewsModifyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public NewsModifyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		NewsDAO dao = new NewsDAO();
		
		NewsDTO dto = dao.newsModify(bno); //select
		
		request.setAttribute("dto", dto);
		
		RequestDispatcher rd = request.getRequestDispatcher("news/newsmodify.jsp");
		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		String savePath = "upload"; //업로드 폴더
		int maxPostSize = 20 * 1024 * 1024; //최대업로드 용량
		String enctype="utf-8";
		
		ServletContext context = getServletContext();
		String path = context.getRealPath(savePath); //업로드 폴더 실제 경로
		System.out.println("서버상의 업로드 실제 디렉토리 : "+path); 
		
		MultipartRequest multi = new MultipartRequest(
				request, //request 객체
				path,  //서버상의 실제 디렉토리
				maxPostSize, //최대 업로드 파일 크기
				enctype, //인코딩
				new DefaultFileRenamePolicy());
		
		
		
		String imgurl = multi.getFilesystemName("imgurl");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		int bno = Integer.parseInt(multi.getParameter("bno"));
		
		NewsDTO dto = new NewsDTO();
		
		dto.setBno(bno);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setImgurl(imgurl);
		dto.setName("관리자");
		
		NewsDAO dao = new NewsDAO();
		
		dao.newsModify(dto); //update
		
		response.sendRedirect("news.do");
		
	}

}
