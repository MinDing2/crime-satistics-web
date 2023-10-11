package com.spring.member.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.oauth2.naver.NaverLoginBO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	/* NaverLoginBO */
	private NaverLoginBO naverLoginBO;
	private String apiResult = null;
	
	@Autowired
	private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
		this.naverLoginBO = naverLoginBO;
	}
	
	/* GoogleLogin */
	@Autowired
	private GoogleConnectionFactory googleConnectionFactory;
	
	@Autowired
	private OAuth2Parameters googleOAuth2Parameters;
	
	/* MemberService */
	@Autowired
	private MemberService memberService;
	
	

	// 
	@GetMapping("/signup-page")
	public String signupForm() {
		return "member/signup";
	}
	
	// 
	@PostMapping("/signup")
	public String signup(MemberVo memberVo) {
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.signup(memberVo);
		return "redirect:/";
	}
	
	//
	@GetMapping("/login-page")
	public String memberLoginFrom(Model model, HttpSession session) {
		/*  */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
		
		/*  */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=6m11DUsaOAlewAFPEIgU&
		// redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fmember%2Fnaver-login%2Fcallback&state=1f5213be-a0af-490f-b4fd-73ac54758bd3
		System.out.println(":" + naverAuthUrl);
		System.out.println("" + url);


		// 
		model.addAttribute("url", naverAuthUrl);
		// 
		model.addAttribute("google_url", url);

		return "member/login";
	}
	
	//
	@GetMapping("/naver-login/callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state); 
	    // 
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		//session.setAttribute("naver", apiResult);
		
		// 
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		System.out.println("obj : " + obj);
		JSONObject jsonObj = (JSONObject) obj;
		
		// 
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		String access_token = oauthToken.getAccessToken(); //
		
		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		//String email = (String) response_obj.get("email");
		//String profile_image = (String) response_obj.get("profile_image");
		//String gender = (String) response_obj.get("gender");
		
		session.setAttribute("naverid", id);
		
	    /*  */
		return "redirect:/";
	}
	
	// �꽕�씠踰� 濡쒓렇�븘�썐
	@GetMapping("/naver-logout")
    public String naverLogout(HttpSession session) throws IOException {
		
        session.invalidate(); // 
        return "redirect:/"; // 
    }

	// 
	@GetMapping("/google-login/callback")
	public String googleCallback(Model model, @RequestParam String code, HttpSession session) throws IOException {
		 OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		    AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(), null);

		    String accessToken = accessGrant.getAccessToken();
		    String refreshToken = accessGrant.getRefreshToken();

		    // Access Toke
		    OAuth2Parameters parameters = new OAuth2Parameters();
		    RestTemplate restTemplate = new RestTemplate();
		    HttpHeaders headers = new HttpHeaders();
		    headers.set("Authorization", "Bearer " + accessToken);
		    HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

		    ResponseEntity<String> result = restTemplate.exchange(
		            "https://www.googleapis.com/oauth2/v2/userinfo",
		            HttpMethod.GET,
		            entity,
		            String.class
		    );

		    String userInfo = result.getBody();

		    // 
		    ObjectMapper objectMapper = new ObjectMapper();
		    JsonNode node = objectMapper.readTree(userInfo);
		    String googleid = node.get("id").asText();

		    session.setAttribute("googleid", googleid);

		return "redirect:/";
	}
	
	// 
	@GetMapping("/google-logout")
	public String googleLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}


	//
	@PostMapping("/login")
	public String memberLogin(MemberVo memberVo, HttpSession session, Model model) {
		
		MemberVo loginMember = memberService.login(memberVo);
		session.setAttribute("memberid", loginMember.getMemberid());
		session.setAttribute("nickname", loginMember.getNickname());
		return "redirect:/";
	}
	
	// 
	@GetMapping("/logout")
	public String memberLogout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/";
	}
	
	// 
	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		String memberid = (String)session.getAttribute("memberid");
		MemberVo findMember = memberService.findById(memberid);
		model.addAttribute("member", findMember);
		return "member/mypage";
	}
	
	// ds
	@PostMapping("/modify")
	public String memberModify(MemberVo memberVo, @RequestParam("newPasswd") String newPasswd) {
		memberVo.setPasswd(newPasswd);
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.memberModify(memberVo);
		return "redirect:/member/mypage";
	}
	
	// 
	@PostMapping("/delete")
	public String memberDelete(HttpSession session) {
		String memberid = (String)session.getAttribute("memberid");
		memberService.memberDelete(memberid);
		session.invalidate();
		return "redirect:/";
	}
}
