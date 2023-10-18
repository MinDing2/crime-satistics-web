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

	// �쉶�썝媛��엯 �럹�씠吏�
	@GetMapping("/signup-page")
	public String signupForm() {
		return "member/signup";
	}

	// �쉶�썝媛��엯
	@PostMapping("/signup")
	public String signup(MemberVo memberVo) {
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.signup(memberVo);
		return "redirect:/";
	}

	// 濡쒓렇�씤 �럹�씠吏�
	@GetMapping("/login-page")
	public String memberLoginFrom(Model model, HttpSession session) {
		/* �꽕�씠踰꾩븘�씠�뵒濡� �씤利� URL�쓣 �깮�꽦�븯湲� �쐞�븯�뿬 naverLoginBO�겢�옒�뒪�쓽 getAuthorizationUrl硫붿냼�뱶 �샇異� */
		String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

		/* 援ш�code 諛쒗뻾 */
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);

		// https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=6m11DUsaOAlewAFPEIgU&
		// redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Fmember%2Fnaver-login%2Fcallback&state=1f5213be-a0af-490f-b4fd-73ac54758bd3
		System.out.println("�꽕�씠踰�:" + naverAuthUrl);
		System.out.println("援ш�:" + url);

		// �꽕�씠踰�
		model.addAttribute("url", naverAuthUrl);
		// 援ш�
		model.addAttribute("google_url", url);

		return "member/login";
	}

	// �꽕�씠踰� 濡쒓렇�씤 �꽦怨듭떆 callback�샇異� 硫붿냼�뱶
	@GetMapping("/naver-login/callback")
	public String callback(@RequestParam String code, @RequestParam String state, HttpSession session)
			throws IOException, ParseException {
		OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
		// 濡쒓렇�씤 �궗�슜�옄 �젙蹂대�� �씫�뼱�삩�떎.
		apiResult = naverLoginBO.getUserProfile(oauthToken);
		// session.setAttribute("naver", apiResult);

		// String �삎�떇�씤 apiResult瑜� json �삎�깭濡� 諛붽퓞
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(apiResult);
		System.out.println("obj : " + obj);
		JSONObject jsonObj = (JSONObject) obj;

		// �뜲�씠�꽣 �뙆�떛
		JSONObject response_obj = (JSONObject) jsonObj.get("response");
		String access_token = oauthToken.getAccessToken(); // �넗�겙

		String id = (String) response_obj.get("id");
		String name = (String) response_obj.get("name");
		// String email = (String) response_obj.get("email");
		// String profile_image = (String) response_obj.get("profile_image");
		// String gender = (String) response_obj.get("gender");

		session.setAttribute("naverid", id);
		session.setMaxInactiveInterval(3600);

		/* �꽕�씠踰� 濡쒓렇�씤 �꽦怨� �럹�씠吏� View �샇異� */
		return "redirect:/";
	}

	// �꽕�씠踰� 濡쒓렇�븘�썐
	@GetMapping("/naver-logout")
	public String naverLogout(HttpSession session) throws IOException {

		session.invalidate(); // 濡쒖뺄 �꽭�뀡 臾댄슚�솕
		return "redirect:/"; // 濡쒓렇�븘�썐 �썑 由щ떎�씠�젆�듃�븷 URL
	}

	// 援ш� Callback�샇異� 硫붿냼�뱶
	@GetMapping("/google-login/callback")
	public String googleCallback(Model model, @RequestParam String code, HttpSession session) throws IOException {
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, googleOAuth2Parameters.getRedirectUri(),
				null);

		String accessToken = accessGrant.getAccessToken();
		String refreshToken = accessGrant.getRefreshToken();

		// Access Token�쓣 �씠�슜�븯�뿬 �궗�슜�옄 �젙蹂대�� �슂泥�
		OAuth2Parameters parameters = new OAuth2Parameters();
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "Bearer " + accessToken);
		HttpEntity<String> entity = new HttpEntity<>("parameters", headers);

		ResponseEntity<String> result = restTemplate.exchange("https://www.googleapis.com/oauth2/v2/userinfo",
				HttpMethod.GET, entity, String.class);

		String userInfo = result.getBody();

		// userInfo瑜� �썝�븯�뒗 �삎�깭濡� �뙆�떛�븯�뿬 �븘�슂�븳 �젙蹂대�� 異붿텧�븯怨� �꽭�뀡�뿉 ���옣
		// �삁瑜� �뱾�뼱, JSON �뙆�떛 �씪�씠釉뚮윭由щ�� �궗�슜�븯�뿬 userInfo瑜� �뙆�떛�븷 �닔 �엳�뒿�땲�떎.
		// �뿬湲곗꽌�뒗 �삁�떆濡� Google�쓽 �궗�슜�옄 ID瑜� 媛��졇�삤�뒗 寃껋쑝濡� 媛��젙�빀�땲�떎.
		ObjectMapper objectMapper = new ObjectMapper();
		JsonNode node = objectMapper.readTree(userInfo);
		String googleid = node.get("id").asText();

		session.setAttribute("googleid", googleid);
		session.setMaxInactiveInterval(3600);

		return "redirect:/";
	}

	// 援ш� 濡쒓렇�븘�썐
	@GetMapping("/google-logout")
	public String googleLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}

	// �뤌 濡쒓렇�씤 �꽦怨�
	@PostMapping("/login")
	public String memberLogin(MemberVo memberVo, HttpSession session, Model model) {

		MemberVo loginMember = memberService.login(memberVo);
		session.setAttribute("memberid", loginMember.getMemberid());
		session.setAttribute("nickname", loginMember.getNickname());
		session.setMaxInactiveInterval(3600);
		return "redirect:/";
	}

	// 濡쒓렇�븘�썐
	@GetMapping("/logout")
	public String memberLogout(HttpSession session) {
		memberService.logout(session);
		return "redirect:/";
	}

	// �쉶�썝 �깉�눜
	@GetMapping("/delete")
	public String memberDelete(HttpSession session) {
		String memberid = (String) session.getAttribute("memberid");
		memberService.memberDelete(memberid);
		session.invalidate();
		return "redirect:/";
	}

	//
	@GetMapping("/mypage")
	public String mypage(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// 
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		//
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 
		model.addAttribute("member", memberService.findById(memberid));
		// 
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		//
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/index";
	}

	// 二쇰Ц紐⑸줉(留덉씠�럹�씠吏�)
	@GetMapping("/mypage/orderInfo")
	public String getOrderInfoList(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// �옣諛붽뎄�땲 �떞�� 媛��닔
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 由щ럭 媛��닔
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 二쇰Ц 由ъ뒪�듃
		model.addAttribute("orderInfo", shopService.getOrderInfoList(memberid));
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/orderInfoList";
	}

	// 二쇰Ц�긽�꽭(留덉씠�럹�씠吏�)
	@GetMapping("/mypage/orderDetail")
	public String getOrderDetail(@RequestParam("orderid") String orderid, BoardVo boardVo, HttpSession session,
			Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// �옣諛붽뎄�땲 �떞�� 媛��닔
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 由щ럭 媛��닔
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 二쇰Ц �긽�꽭
		model.addAttribute("orderDetailList", shopService.getOrderDetail(orderid));
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/orderDetail";
	}

	// �긽�뭹�썑湲�(留덉씠�럹�씠吏�)
	@GetMapping("/mypage/review")
	public String getReviewList(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// �옣諛붽뎄�땲 �떞�� 媛��닔
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 由щ럭 由ъ뒪�듃
		model.addAttribute("reviewList", shopService.getReviewList(memberid));
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/reviewList";
	}

	// �룷�씤�듃
	@GetMapping("/mypage/point")
	public String getPoint(BoardVo boardVo, HttpSession session, Model model) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		// �옣諛붽뎄�땲 �떞�� 媛��닔
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 由щ럭 媛��닔
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// 
		model.addAttribute("pointList", shopService.getPointList(memberid));
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/point";
	}

	// �룷�씤�듃 �궡�뿭 湲곌컙 議고쉶
	@GetMapping("/mypage/point/date")
	public String getPoint(BoardVo boardVo, HttpSession session, Model model,
			@RequestParam("startDate") String startDate, @RequestParam("endDate") String endDate)
			throws java.text.ParseException {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

		Date stDate = dateFormat.parse(startDate);
		Date edDate = dateFormat.parse(endDate);

		// �옣諛붽뎄�땲 �떞�� 媛��닔
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 由щ럭 媛��닔
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		// �룷�씤�듃 �궡�뿭 湲곌컙 議고쉶
		model.addAttribute("pointList", shopService.showPointDate(stDate, edDate, memberid));
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/point";
	}

	// �쉶�썝�젙蹂댁닔�젙
	@GetMapping("/mypage/modify")
	public String myInfo(BoardVo boardVo, HttpSession session, Model model) {
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");

		model.addAttribute("member", memberService.findById(memberid));
		// �옣諛붽뎄�땲 �떞�� 媛��닔
		model.addAttribute("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		model.addAttribute("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		model.addAttribute("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		model.addAttribute("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		model.addAttribute("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		model.addAttribute("myLikeCnt", boardService.mylikeList(memberid).size());
		// 由щ럭 媛��닔
		model.addAttribute("reviewCnt", shopService.getReviewList(memberid).size());
		
		model.addAttribute("questionCnt",questionService.searchCount(memberid, nickname));

		return "member/mypage/myInfoModify";
	}

	// �쉶�썝�젙蹂댁닔�젙
	@PostMapping("/mypage/modify")
	public String myInfoModify(MemberVo memberVo, @RequestParam("newPasswd") String newPasswd) {
		memberVo.setPasswd(newPasswd);
		memberVo.setAddress(memberVo.getAddress_primary() + " " + memberVo.getAddress_detail());
		memberVo.setEmail(memberVo.getEmailId() + "@" + memberVo.getEmailDomain());
		memberService.memberModify(memberVo);
		return "redirect:/member/mypage/modify";
	}

	// �옉�꽦�븳 寃뚯떆臾�
	@GetMapping("/mypage/myboard")
	public ModelAndView myboard(BoardVo boardVo, HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<BoardVo> myboardList = boardService.myboardList(nickname);

		ModelAndView mv = new ModelAndView();
		// �옣諛붽뎄�땲 �떞�� 媛��닔
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		mv.addObject("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 醫뗭븘�슂 �늻瑜� 寃뚯떆臾� 媛��닔
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("myboardList", myboardList);
		mv.addObject("member", memberService.findById(memberid));
		// 由щ럭 媛��닔
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		
		mv.addObject("questionCnt",questionService.searchCount(memberid, nickname));
		mv.setViewName("member/mypage/myboardList");
		return mv;
	}

	// �옉�꽦�븳 �뙎湲�
	@GetMapping("/mypage/myreply")
	public ModelAndView myreply(BoardVo boardVo, HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<ReplyVo> myreplyList = replyService.myreplyList(nickname);

		ModelAndView mv = new ModelAndView();
		// �옣諛붽뎄�땲 �떞�� 媛��닔
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 寃곗젣�셿猷� 媛��닔
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// �룷�씤�듃 異붿텧 ${member.point}
		mv.addObject("member", memberService.findById(memberid));
		// �옉�꽦寃뚯떆臾� 媛��닔
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// �옉�꽦�뙎湲� 媛��닔
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("myreplyList", myreplyList);
		mv.addObject("member", memberService.findById(memberid));
		// 
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		
		mv.addObject("questionCnt",questionService.searchCount(memberid, nickname));
		mv.setViewName("member/mypage/myreplyList");
		return mv;
	}

	//
	@GetMapping("/mypage/mylike")
	public ModelAndView mylike(BoardVo boardVo, HttpSession session) {

		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<BoardVo> mylikeList = boardService.mylikeList(memberid);

		ModelAndView mv = new ModelAndView();
		// 
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 
		mv.addObject("member", memberService.findById(memberid));
		//
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		// 
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		// 
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("mylikeList", mylikeList);
		mv.addObject("member", memberService.findById(memberid));
		// 
		mv.addObject("reviewCnt", shopService.getReviewList(memberid).size());
		
		mv.addObject("questionCnt",questionService.searchCount(memberid, nickname));
		mv.setViewName("member/mypage/mylikeList");

		return mv;
	}

	// 
	@GetMapping("/mypage/myanswer")
	public ModelAndView myQuestion(BoardVo boardVo, QuestionVo queVo, HttpSession session, Model model,
			@RequestParam("num") int num,
			@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		// 
		// 
		Page2 page = new Page2();

		page.setNum(num);

		page.setCount(questionService.searchCount(searchType, keyword));

		//
		page.setSearchType(searchType);
		page.setKeyword(keyword);

		List<QuestionVo> list = null;
		list = questionService.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);

		// 
		String memberid = (String) session.getAttribute("memberid");
		String nickname = (String) session.getAttribute("nickname");
		List<ReplyVo> myreplyList = replyService.myreplyList(nickname);

		// 
		ModelAndView mv = new ModelAndView();
		// 
		mv.addObject("cartCnt", shopService.getCartList(memberid).size());
		// 
		mv.addObject("orderInfoCnt", shopService.getOrderInfoList(memberid).size());
		// 
		mv.addObject("member", memberService.findById(memberid));
		// 
		mv.addObject("myBoardCnt", boardService.myBoardcnt(boardVo, nickname));
		//
		mv.addObject("myReplyCnt", replyService.myReplyCnt(nickname));
		//
		mv.addObject("questionCnt", questionService.searchCount(memberid, nickname));
	
		//
		mv.addObject("myLikeCnt", boardService.mylikeList(memberid).size());
		mv.addObject("myreplyList", myreplyList);
		mv.addObject("member", memberService.findById(memberid));

		// 
		// model.addAttribute("list", list);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("select", num);

		mv.setViewName("member/mypage/myAnswerList");
		
		return mv;
	}

}
