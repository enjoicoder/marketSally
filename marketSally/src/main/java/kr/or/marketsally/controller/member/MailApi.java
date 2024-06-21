package kr.or.marketsally.controller.member;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Properties;

import javax.activation.CommandMap;
import javax.activation.MailcapCommandMap;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Message.RecipientType;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import kr.or.marketsally.member.service.IMemberService;
import kr.or.marketsally.member.service.MemberServiceImpl;
import kr.or.marketsally.member.vo.MemberVO;

@WebServlet("/tempPass.do")
public class MailApi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		final String bodyEncoding = "UTF-8"; // 콘텐츠 인코딩

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("application/jason; charset=utf-8");
		PrintWriter out = response.getWriter();

		// 입력한 아이디와 이메일을 파라미터로 받아오기
		String logid = request.getParameter("id");
		String email = request.getParameter("email");
//		String toEmail = "받을 이메일 주소1,받을 이메일 주소2,"; // 콤마(,)로 여러개 나열 밑에서 setRecipients 사용
		String temp = request.getParameter("temp");

		System.out.println("logid, email, temp = " + logid + ", " + email + ", " + temp);
		
		// 받아온 파라미터를 MemberVO에 저장
		MemberVO mvo = new MemberVO();
		mvo.setMem_logid(logid);
		mvo.setMem_email(email);

		System.out.println("mvo = " + mvo.toString());

		// 저장한 mvo객체를 통해 회원 비밀번호 찾아오기
		String findPass = "";	// 비밀번호 널로 초기화
		IMemberService service = MemberServiceImpl.getInstance();
		findPass = service.findPassSally(mvo);

		System.out.println("findPass = " + findPass);

		Gson gson = new Gson();
		String jsonData = "";
		
		if (findPass == null) { // 비밀번호를 찾아오지 못했을 경우

			jsonData = gson.toJson("회원정보가 일치하지 않습니다.");

		} else { // 비밀번호를 찾아왔을 경우, 비밀번호를 임시 비밀번호로 변경
			
			// 비밀번호를 임시비밀번호로 바꿀 Member객체 생성
			MemberVO memVo = new MemberVO();
			memVo.setMem_pass(temp);
			memVo.setMem_logid(logid);
			memVo.setMem_email(email);
			System.out.println("mvo = " + memVo.toString());

			int resUpdate = 0;	// 업데이트 결과가 반영될 변수 설정
			resUpdate = service.updatePass(memVo);
			System.out.println("resUpdate = " + resUpdate);

			if (resUpdate == 1) {	// 임시비밀번호로 변경이 성공했을 경우 메일 발송

				String subject = "MarketSally 임시 비밀번호 입니다."; // 제목
				String host = "marketsally_service@naver.com"; // 보내는 메일 주소
				String hostName = "마켓셀리_서비스센터"; // 보내는 사람 이름

				final String username = "marketsally_service@naver.com";
				final String password = "Sally1231!";
//				final String password = "lzlnmuzxsmnxdjrh";

				// 메일에 출력할 텍스트
				StringBuffer sb = new StringBuffer();
				sb.append("<h3>MarketSally 임시 비밀번호 입니다.</h3>\n");
				sb.append("<h2>" + temp + "</h2>\n");
				sb.append("<h3>임시 비밀번호로 로그인 후 개인정보 보호를 위해 비밀번호를 변경해주시기 바랍니다.</h3>\n");
				String html = sb.toString();

				// 메일 옵션 설정
				Properties p = System.getProperties();
		        p.put("mail.smtp.starttls.enable", "true");
		        p.put("mail.smtp.host", "smtp.naver.com");
		        p.put("mail.smtp.auth", "true");
		        p.put("mail.smtp.port", "587");
		 

				try {
					// 메일 서버 인증 계정 설정
					Authenticator auth = new Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(username, password);
						}
					};

					// 메일 세션 생성
					Session session = Session.getDefaultInstance(p, auth);

					// 메일 송/수신 옵션 설정
					Message message = new MimeMessage(session);
					message.setFrom(new InternetAddress(host, hostName));
					message.setRecipients(RecipientType.TO, InternetAddress.parse(email, false));
					message.setSubject(subject);
					message.setSentDate(new Date());

					// 메일 콘텐츠 설정
					Multipart mParts = new MimeMultipart();
					MimeBodyPart mTextPart = new MimeBodyPart();
					MimeBodyPart mFilePart = null;

					// 메일 콘텐츠 - 내용
					mTextPart.setText(html, bodyEncoding, "html");
					mParts.addBodyPart(mTextPart);

					// 메일 콘텐츠 설정
					message.setContent(mParts);

					// MIME 타입 설정
					MailcapCommandMap MailcapCmdMap = (MailcapCommandMap) CommandMap.getDefaultCommandMap();
					MailcapCmdMap.addMailcap("text/html;; x-java-content-handler=com.sun.mail.handlers.text_html");
					MailcapCmdMap.addMailcap("text/xml;; x-java-content-handler=com.sun.mail.handlers.text_xml");
					MailcapCmdMap.addMailcap("text/plain;; x-java-content-handler=com.sun.mail.handlers.text_plain");
					MailcapCmdMap
							.addMailcap("multipart/*;; x-java-content-handler=com.sun.mail.handlers.multipart_mixed");
					MailcapCmdMap
							.addMailcap("message/rfc822;; x-java-content-handler=com.sun.mail.handlers.message_rfc822");
					CommandMap.setDefaultCommandMap(MailcapCmdMap);

					// 메일 발송
					Transport.send(message);
				} catch(AddressException addr_e){
					addr_e.printStackTrace();
				} catch (MessagingException msg_e) {
					msg_e.printStackTrace();
				}

				jsonData = gson.toJson("이메일로 임시비밀번호를 발송했습니다");
			}else {
				jsonData = gson.toJson("이메일 임시비밀번호를 발송 실패");
			}
		}

		out.write(jsonData);
		out.flush();
	}
}
