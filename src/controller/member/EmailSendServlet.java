package controller.member;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;


@WebServlet("/emailsend.do")
public class EmailSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public EmailSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//실제 이메일이 보내지는 프로그램을 여기에서 만들어야함
				//https://smujihoon.tistory.com/96참조
				
				String email = request.getParameter("email"); //mypage.jsp로부터 이메일주소요청 
				
				//mail server 설정
		        String host = "smtp.naver.com";
		        String user = "sejong323@naver.com"; //자신의 네이버 계정
		        String password = "ma0314nu";//자신의 네이버 패스워드
		        
		        //메일 받을 주소
		        String to_email = email;
		        
		        //SMTP 서버 정보를 설정한다.
		        Properties props = new Properties();
		        props.put("mail.smtp.host", host);
		        props.put("mail.smtp.port", 465);
		        props.put("mail.smtp.auth", "true");
		        props.put("mail.smtp.ssl.enable", "true");
		        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
		        
		        //인증 번호 생성기
		        StringBuffer temp =new StringBuffer(); 
		        Random rnd = new Random(); //임의숫자
		        for(int i=0;i<10;i++)
		        {
		            int rIndex = rnd.nextInt(3); // 0 1 2 :3 이전까지의 무작위의 숫자
		            switch (rIndex) {
		            case 0:
		                // a-z
		                temp.append((char) ((int) (rnd.nextInt(26)) + 97)); //0~26까지의 무작위의 숫자 +97
		                break;
		            case 1:
		                // A-Z
		                temp.append((char) ((int) (rnd.nextInt(26)) + 65));
		                break;
		            case 2:
		                // 0-9
		                temp.append((rnd.nextInt(10)));
		                break;
		            }
		        }
		        String AuthenticationKey = temp.toString();
		        System.out.println(AuthenticationKey);
		        
		        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		            protected PasswordAuthentication getPasswordAuthentication() {
		                return new PasswordAuthentication(user,password);
		            }
		        });
		        
		        //email 전송
		        try {
		            MimeMessage msg = new MimeMessage(session);
		            msg.setFrom(new InternetAddress(user, "HANULSO"));
		            msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
		            
		            //메일 제목
		            msg.setSubject("안녕하세요 HANULSO 인증 메일입니다.");
		            //메일 내용
		            msg.setText("인증 번호는 :"+temp);
		            
		            Transport.send(msg);
		            System.out.println("이메일 전송");
		            
		        }catch (Exception e) {
		            e.printStackTrace();// TODO: handle exception
		        }
		        HttpSession saveKey = request.getSession();
		        saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
		        //인증번호를 AuthenticationKey 세션 속성에 저장한다
		        
		        JSONObject obj = new JSONObject(); //Json객체 생성
		        obj.put("msg","메일로 인증번호 전송 완료"); //("key","value")     
		        response.setCharacterEncoding("utf-8");
		        response.setContentType("application/x-json, charset=utf-8");
		        response.getWriter().print(obj); //obj가 mypage.jsp 의 data로 넘어감
		}
	}


