package com.us.uni.user.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.user.model.service.MemberService;
import com.us.uni.user.model.vo.Member;


@Controller
public class MemberController {
	
	@Autowired
	private MemberService uService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public ModelAndView loginUser(Member m, HttpSession session, ModelAndView mv){
	
		Member loginUser = uService.loginUser(m);
		
		if(loginUser == null) { 
			// 로그인 실패 
			mv.addObject("errorMsg", "로그인 실패");
			mv.setViewName("common/errorPage"); 
		}else { 
			// 로그인 성공 
			mv.addObject("alertMsg", "로그인 성공!");
			session.setAttribute("loginUser", loginUser);
			
			
			mv.setViewName("common/mainPage"); 
			//mv.setViewName("redirect:/");
		}
		
		return mv;
		
	}
	
}
