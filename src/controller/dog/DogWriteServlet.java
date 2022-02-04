package controller.dog;

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

import dao.DogDAO;
import dto.DogDTO;


@WebServlet("/dogwrite.do")
public class DogWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DogWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		RequestDispatcher rd = request.getRequestDispatcher("dog/dogwrite.jsp");
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
		
		String name = multi.getParameter("name");
		String kind = multi.getParameter("kind");
		int age = Integer.parseInt(multi.getParameter("age"));
		String gender = multi.getParameter("gender");
		String enterdate = multi.getParameter("enterdate");
		String imgurl = multi.getFilesystemName("imgurl");
		
		DogDTO ddto = new DogDTO();
		
		ddto.setName(name);
		ddto.setKind(kind);
		ddto.setAge(age);
		ddto.setGender(gender);
		ddto.setEnterdate(enterdate);
		ddto.setImgurl(imgurl);
		
		DogDAO ddao = new DogDAO();
		
		ddao.dogInsert(ddto);
		
		response.sendRedirect("dog.do");
		
		
		
		
	}

}
