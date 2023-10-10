package com.spring.admin.interceptor;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

public class AdminInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception {
		HttpSession session = req.getSession();
		String memberid = (String)session.getAttribute("memberid");
		String adminid  = (String)session.getAttribute("adminid");
		
		// �쉶�썝 濡쒓렇�씤 �긽�깭媛� �븘�땲硫�, 愿�由ъ옄 濡쒓렇�씤 �긽�깭媛� �븘�땺 �븣�뿉留� �뿀�슜
	    if (memberid == null && adminid == null) { 
	        String requestUri = req.getRequestURI();
	        if (requestUri.equals("/admin/login-page") || requestUri.equals("/admin/login")) {
	            return true;
	        } else {
	            res.sendRedirect("/member/login-page");
	            return false;
	        }
	    } else if (memberid != null && adminid == null) { // �쉶�썝 濡쒓렇�씤 �긽�깭�씪 �븣
	        res.sendRedirect("/");
	        return false;
	    }
	
	    return true; // 愿�由ъ옄 濡쒓렇�씤 �긽�깭�씪 �븣 怨꾩냽 吏꾪뻾
	}
}
