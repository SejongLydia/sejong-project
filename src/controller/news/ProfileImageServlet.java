package controller.news;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/profileImage.do")
public class ProfileImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProfileImageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		ServletContext svc = request.getServletContext(); //프로젝트 이름을 구함
		
		String path = svc.getRealPath("portcontent"); //실제 업로드가 되는 경로
		String encType="utf-8";
		int uploadSizeMax = 20 * 1024 * 1024;
		
		MultipartRequest mr = new MultipartRequest(
				request,
				path,
				uploadSizeMax,
				encType,
				new DefaultFileRenamePolicy() //겹치는 이름이 있을경우 새로운 이름을 만들어서 저장하시오
				);
		//썸머노트안에 첨부된 이미지 업로드 완료
		String file = mr.getFilesystemName("file"); //portfolio_write.jsp의 form_data.append('file', file);이름과 통일
		//썸머노트 안에서 업로드 시킨 실제파일의 이름을 구한다
		response.setContentType("text/html; chatset=utf-8"); //리스폰스 타입
		PrintWriter out = response.getWriter();
		
		out.print("portcontent"+"/"+file); //portcontent/a.jpg
		//success: function(img_name) {로 리턴
		out.close();
		
	}

}
