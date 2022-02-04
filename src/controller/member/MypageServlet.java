package controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;


@WebServlet("/mypage.do")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public MypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("member/mypage.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String certinumber = request.getParameter("certinumber"); //certinumber값 요청
		String AuthenKey = (String)request.getSession().getAttribute("AuthenticationKey");
		//certinumber:사용자한테 입력받은 인증번호
		//AuthenKey:자동생성된 인증번호
		
		JSONObject obj = new JSONObject(); //넘어오는 데이터타입이 JSON이기 때문에 JSONObject객체 생성을 해줘야 한다
		if(certinumber.equals(AuthenKey)) {
			obj.put("msg", "회원정보를 수정합니다");
			obj.put("check", "ok");
			// {msg:"회원정보를 수정합니다", check:"ok"}
		}else {
			obj.put("msg", "인증번호 불일치");
			obj.put("check", "nok");
		}
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/x-json,charset=utf-8");
		response.getWriter().print(obj);
		//success(data)로 obj가 전송된다 mypage.jsp
	}

}
