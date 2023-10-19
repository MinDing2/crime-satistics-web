package com.spring.member.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.spring.board.domain.ReplyVo;
import com.spring.board.service.BoardService;
import com.spring.board.service.ReplyService;
import com.spring.board.vo.BoardVo;
import com.spring.member.service.MemberService;
import com.spring.member.vo.MemberVo;
import com.spring.oauth2.naver.NaverLoginBO;
import com.spring.question.service.QuestionService;
import com.spring.question.vo.Page2;
import com.spring.question.vo.QuestionVo;
import com.spring.shop.service.ShopService;

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

	@Autowired
	private MemberService memberService;

	@Autowired
	private ShopService shopService;

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;
	
	@Autowired
	private QuestionService questionService;

	// 회원가입 페이지
	@GetMapping("/signup-page")
	public String signupForm() {
		return "member/signup";
	}

	// 회원가입
	@PostMapping("/signup")
	public String signup(MemberVo memberVo) {
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.signup(memberVo);
		return "redirect:/";
	}

	// 로그인 페이지
	@GetMapping("/login-page")
	public String memberLoginFrom(Model model, HttpSession session) {
		/* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		/* 구글code 발행 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=6m11DUsaOAlewAFPEIgU&
		// redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fmember%2Fnaver-login%2Fcallback&state=1f5213be-a0af-490f-b4fd-73ac54758bd3
		System.out.println("네이버:" + naverAuthUrl);
		System.out.println("구글:" + url);

		// 네이버
		model.addAttribute("url", naverAuthUrl);
		// 구글
		model.addAttribute("google_url", url);

		return "member/login";
	}

	// 네이버 로그인 성공시 callback호출 메소드
	@GetMapping("/naver-login/callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 로그인 사용자 정보를 읽어온다.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		// session.setAttribute("naver", apiResult);

		// String 형식인 apiResult를 json 형태로 바꿈
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		System.out.println("obj : " + obj);
		JSONObject jsonObj = (JSONObject) obj;

		//  데이터 파싱
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		String access_token = oauthToken.getAccessToken(); // 토큰

		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		// String email = (String) response_obj.get("email");
		// String profile_image = (String) response_obj.get("profile_image");
		// String gender = (String) response_obj.get("gender");

		session.setAttribute("naverid", id);
		session.setMaxInactiveInterval(3600);

		/* 네이버 로그인 성공 페이지 View 호출 */
		return "redirect:/";
	}

	// 네이버 로그아웃
	@GetMapping("/naver-logout")
	public String naverLogout(HttpSession session) throws IOException {

		session.invalidate(); // 로컬 세션 무효화
		return "redirect:/";   // 로그아웃 후 리다이렉트할 URL
	}

	// 구글 Callback호출 메소드
	@GetMapping("/google-login/callback")
	public String googleCallback(Model model, @RequestParam String code, HttpSession session) throws IOException {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		String refreshToken = accessGrant.getRefreshToken();

		// Access Token을 이용하여 사용자 정보를 요청
		OAuth2Parameters parameters = new OAuth2Parameters();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + accessToken);
		HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

		ResponseEntity<String> result = restTemplate.exchange("https://www.googleapis.com/oauth2/v2/userinfo",
				HttpMethod.GET, entity, String.class);

		String userInfo = result.getBody();

		// userInfo를 원하는 형태로 파싱하여 필요한 정보를 추출하고 세션에 저장
		// 예를 들어, JSON 파싱 라이브러리를 사용하여 userInfo를 파싱할 수 있습니다.
        // 여기서는 예시로 Google의 사용자 ID를 가져오는 것으로 가정합니다.
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode node = objectMapper.readTree(userInfo);
		String googleid = node.get("id").asText();

		session.setAttribute("googleid", googleid);
		session.setMaxInactiveInterval(3600);

		return "redirect:/";
	}

	// 구글 로그아웃
	@GetMapping("/google-logout")
	public String googleLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// 폼 로그인 성공
	@PostMapping("/login")
	public String memberLogin(MemberVo memberVo, HttpSession session, Model model) {

		MemberVo loginMember = memberService.login(memberVo);
		session.setAttribute("memberid", loginMember.getMemberid());
		session.setAttribute("nickname", loginMember.getNickname());
		session.setMaxInactiveInterval(3600);
		return "redirect:/";
	}

	// 로그아웃
	@GetMapping("/logout")
	public String memberLogout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/";
	}

	// 회원 탈퇴
	@GetMapping("/delete")
	public String memberDelete(HttpSession session) {
		String memberid = (String) session.getAttribute("memberid");
		memberService.memberDelete(memberid);
		session.invalidate();
		return "redirect:/";
	}

	//마이페이지
	@GetMapping("/mypage")
	public String mypage(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 리뷰 갯수
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		
		model.addAttribute("questionCnt",questionService.questionCnt(memberid, nickname));

		return "member/mypage/index";
	}

	// 주문목록(마이페이지)
	@GetMapping("/mypage/orderInfo")
	public String getOrderInfoList(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 리뷰 갯수
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 주문 리스트
		model.addAttribute("orderInfo", shopService.getOrderInfoList(memberid));
		// 질문 개수 
		model.addAttribute("questionCnt",questionService.questionCnt(memberid, nickname));

		return "member/mypage/orderInfoList";
	}

	// 주문상세(마이페이지)
	@GetMapping("/mypage/orderDetail")
	public String getOrderDetail(@RequestParam("orderid") String orderid, BoardVo boardVo, HttpSession session,
			Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");


		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 리뷰 갯수
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 주문 상세
		model.addAttribute("orderDetailList", shopService.getOrderDetail(orderid));
		// 질문 개수
		model.addAttribute("questionCnt",questionService.questionCnt(memberid, nickname));

		return "member/mypage/orderDetail";
	}

	//  상품후기(마이페이지)
	@GetMapping("/mypage/review")
	public String getReviewList(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 리뷰 리스트
		model.addAttribute("reviewList", shopService.getReviewList(memberid));
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		//질문 개수 
		model.addAttribute("questionCnt",questionService.questionCnt(memberid, nickname));

		return "member/mypage/reviewList";
	}

	// 포인트
	@GetMapping("/mypage/point")
	public String getPoint(BoardVo boardVo, HttpSession session, Model model) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 리뷰 갯수
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 포인트 내역
		model.addAttribute("pointList", shopService.getPointList(memberid));
		// 질문개수  수정 완료
		model.addAttribute("questionCnt", questionService.questionCnt(memberid, nickname));
	

		return "member/mypage/point";
	}

	// 포인트 내역 기간 조회
	@GetMapping("/mypage/point/date")
	public String getPoint(BoardVo boardVo, HttpSession session, Model model,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate)
			throws java.text.ParseException {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date stDate = dateFormat.parse(startDate);
		Date edDate = dateFormat.parse(endDate);

		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
    	model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
    	// 작성댓글 갯수
    	model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
    	// 좋아요 누른 게시물 갯수
    	model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
    	// 리뷰 갯수
    	model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 포인트 내역 기간 조회
    	model.addAttribute("pointList", shopService.showPointDate(stDate, edDate, memberid));
    	// 질문개수  수정 완료
    	model.addAttribute("questionCnt", questionService.questionCnt(memberid, nickname));
	
		return "member/mypage/point";
	}

	// 회원정보수정
	@GetMapping("/mypage/modify")
	public String myInfo(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		model.addAttribute("member", memberService.findById(memberid));
		// 장바구니 담은 갯수
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// 작성게시물 갯수
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 리뷰 갯수
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 질문개수  수정 완료
		model.addAttribute("questionCnt", questionService.questionCnt(memberid, nickname));
	
		return "member/mypage/myInfoModify";
	}

	//  회원정보수정
	@PostMapping("/mypage/modify")
	public String myInfoModify(MemberVo memberVo, @RequestParam("newPasswd") String newPasswd) {
		memberVo.setPasswd(newPasswd);
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.memberModify(memberVo);
		return "redirect:/member/mypage/modify";
	}

	// 작성한 게시물
	@GetMapping("/mypage/myboard")
	public ModelAndView myboard(BoardVo boardVo, HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<BoardVo> myboardList = boardService.myboardList(nickname);

		ModelAndView mv = new ModelAndView();
		// 장바구니 담은 갯수
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		mv.addObject("member", memberService.findById(memberid));
		// 작성게시물 갯수
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("myboardList", myboardList);
		mv.addObject("member", memberService.findById(memberid));
		
		// 리뷰 개수
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		
		// 질문개수  수정 완료
		mv.addObject("questionCnt", questionService.questionCnt(memberid, nickname));
	
		mv.setViewName("member/mypage/myboardList");
		return mv;
	}

	// 작성한 댓글
	@GetMapping("/mypage/myreply")
	public ModelAndView myreply(BoardVo boardVo, HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<ReplyVo> myreplyList = replyService.myreplyList(nickname);

		ModelAndView mv = new ModelAndView();
		// 장바구니 담은 갯수
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 개수 
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트추출 ${member.point}
		mv.addObject("member", memberService.findById(memberid));
		// 작성게시물 갯수
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("myreplyList", myreplyList);
		mv.addObject("member", memberService.findById(memberid));
		// 리뷰 갯수
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		// 질문개수  수정 완료
		mv.addObject("questionCnt", questionService.questionCnt(memberid, nickname));
	
		
		mv.setViewName("member/mypage/myreplyList");
		return mv;
	}

	// 좋아요 누른 게시물
	@GetMapping("/mypage/mylike")
	public ModelAndView mylike(BoardVo boardVo, HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<BoardVo> mylikeList = boardService.mylikeList(memberid);

		ModelAndView mv = new ModelAndView();
		// 장바구니 담은 갯수
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point} 
		mv.addObject("member", memberService.findById(memberid));
		// 작성게시물 갯수
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 좋아요 누른 게시물 갯수
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("mylikeList", mylikeList);
		mv.addObject("member", memberService.findById(memberid));
		// 리뷰 갯수
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		// 질문개수  수정 완료
		mv.addObject("questionCnt", questionService.questionCnt(memberid, nickname));
	
		mv.setViewName("member/mypage/mylikeList");

		return mv;
	}

	//마이 페이지 질문 목록 
	@GetMapping("/mypage/myanswer")
	public ModelAndView myQuestion(BoardVo boardVo, QuestionVo queVo, HttpSession session, Model model,
			@RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		
		// 질문 목록 + 페이징
		Page2 page = new Page2();

		page.setNum(num);

		page.setCount(questionService.searchCount(searchType, keyword));

		// 검색 타입과 검색어 제거
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		// 기존 코드
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		
		List<QuestionVo> list = null;
		list = questionService.listMyPage(page.getDisplayPost(), page.getPostNum(), memberid);
		
		// 객체생성
		ModelAndView mv = new ModelAndView();
		// 장바구니 담은 갯수
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 결제완료 갯수
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 포인트 추출 ${member.point}
		mv.addObject("member", memberService.findById(memberid));
		// 작성게시물 갯수
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 작성댓글 갯수
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 리뷰 갯수
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		// 질문개수  수정 완료
		mv.addObject("questionCnt", questionService.questionCnt(memberid, nickname));
	
		// 좋아요 누른 게시물 갯수
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("member", memberService.findById(memberid));

		// 목록 + 페이징
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		mv.setViewName("member/mypage/myAnswerList");
		
		return mv;
	}

}
