package kr.co.goodee39.controller;

import java.io.IOException;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MailController {

	@Autowired
	JavaMailSender mailSender; 

	@RequestMapping( value = "/member/findPw" , method=RequestMethod.GET )
	public String findPwEmail() {
		return "findPw";
	}
	
	// mailSending 코드
    @RequestMapping( value = "/mail/findPwAuth" , method=RequestMethod.POST )
    public String passwordMailSending(HttpServletRequest request, String e_mail, String hidden, HttpServletResponse response_email) throws IOException {
        
        String setfrom = "scteamokdk@gamil.com"; // root-context에 기입된 계정으로 메일 송신자가 정해짐
        String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
        String title = "OKEEDOKEE 비밀번호 찾기 메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "<h1>안녕하세요 회원님 OKEEDOKEE를 찾아주셔서 감사합니다</h1>"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 비밀번호는 " +hidden+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 비밀번호를 입력하시면 로그인이 됩니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
 
            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return "redirect:/member/loginPage";
    }
    
    @RequestMapping( value = "/member/signupAuthMove" , method=RequestMethod.GET )
	public String signupEmail() {
		return "signupAuth";
	}
    
    @RequestMapping( value = "/mail/signupAuth" , method=RequestMethod.POST )
    public @ResponseBody ResponseEntity<Integer> signupMailSending(HttpServletRequest request, String email, String hidden, HttpServletResponse response_email) throws IOException {
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "scteamokdk@gamil.com";
        String tomail = request.getParameter("email"); // 받는 사람 이메일
        String title = "OKEEDOKEE 회원가입 인증 이메일 입니다."; // 제목
        String content =
        
        System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
        
        System.getProperty("line.separator")+
                
        "안녕하세요 회원님 OKEEDOKEE 홈페이지를 찾아주셔서 감사합니다"
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+

        " 인증번호는 " +dice+ " 입니다. "
        
        +System.getProperty("line.separator")+
        
        System.getProperty("line.separator")+
        
        "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
        
        
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return new ResponseEntity<Integer>(dice, HttpStatus.OK);
    }

}
