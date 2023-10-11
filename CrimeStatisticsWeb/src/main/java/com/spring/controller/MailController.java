package com.spring.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.spring.member.service.MemberService;

@RestController
public class MailController {
	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/mailSender")
	public String mailSending(String email) {
		
		Random r = new Random();
		int num = r.nextInt(888888) + 11111;
		
		String setFrom = "kimm9803@gmail.com";
		String toMail = email;	// 
		String title = "�쉶�썝媛��엯 �씤利� 肄붾뱶";
		String content = 
				"Crime Statistics �솃�럹�씠吏�瑜� 諛⑸Ц�빐二쇱뀛�꽌 媛먯궗�빀�땲�떎." +
		        "<br><br>" + 
		        "�씤利� 踰덊샇�뒗 " + num + "�엯�땲�떎." + 
		        "<br>" + 
		        "�빐�떦 �씤利앸쾲�샇瑜� �씤利앸쾲�샇 �솗�씤���뿉 湲곗엯�븯�뿬 二쇱꽭�슂.";
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
	
	@GetMapping("/id-mailSender")
	public String idMailSending(String email) {
		
		String memberid = memberService.findIdWithEmail(email);
		
		String setFrom = "kimm9803@gmail.com";
		String toMail = email;	// 諛쏅뒗 �궗�엺 �씠硫붿씪
		String title = "�븘�씠�뵒 李얘린";
		String content = 
				"Crime Statistics �솃�럹�씠吏�瑜� 諛⑸Ц�빐二쇱뀛�꽌 媛먯궗�빀�땲�떎." +
		        "<br><br>" + 
		        "�쉶�썝�떂�쓽 �븘�씠�뵒�뒗 " + memberid + "�엯�땲�떎." + 
		        "<br>" + 
		        "�빐�떦 �븘�씠�뵒濡� 濡쒓렇�씤�쓣 �빐二쇱떗�떆�삤.";
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
		
        return memberid;
	}
}
