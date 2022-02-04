package controller.enter;

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

import dao.EnterDAO;
import dto.EnterDTO;


@WebServlet("/enterwrite.do")
public class EnterWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EnterWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("enter/enterwrite.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		EnterDTO edto = new EnterDTO();
		
		String savePath = "upload";
		int maxPostSize = 20 * 1024 * 1024;
		String enctype="utf-8";
		
		ServletContext context = getServletContext();
		String path = context.getRealPath(savePath);
		System.out.println("서버상의 업로드 실제 디렉토리: "+path);
		
		MultipartRequest multi = new MultipartRequest(
				request,
				path,
				maxPostSize,
				enctype,
				new DefaultFileRenamePolicy());
		
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String content = multi.getParameter("content");
		
		String imgurl = multi.getFilesystemName("imgurl");
		
		edto.setName(name);
		edto.setTitle(title);
		edto.setContent(content);
		edto.setImgurl(imgurl);
		
		EnterDAO edao = new EnterDAO();
		
		edao.enterInsert(edto);
		
		response.sendRedirect("enter.do");
		
	}

}
