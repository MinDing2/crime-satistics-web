package com.spring.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@ResponseBody
	@GetMapping("/mailSender")
	public String mailSending(String email) {
		System.out.println("이메일 전송");
		
		Random r = new Random();
		int num = r.nextInt(888888) + 11111;
		
		String setFrom = "kimm9803@gmail.com";
		String toMail = email;	// 받는 사람 이메일
		String title = "회원가입 인증 코드";
		String content = 
				"Crime Statistics 홈페이지를 방문해주셔서 감사합니다." +
		        "<br><br>" + 
		        "인증 번호는 " + num + "입니다." + 
		        "<br>" + 
		        "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content,true);
            mailSender.send(message);
		} catch(Exception e) {
            e.printStackTrace();
        }
        String rnum = Integer.toString(num);
        
        return rnum;
	}
}
