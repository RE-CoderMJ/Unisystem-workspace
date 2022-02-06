package com.us.uni.users.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.users.model.service.UsersService;
import com.us.uni.users.model.vo.Users;


@Controller
public class UsersController {
	
	@Autowired
	private UsersService uService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
	@RequestMapping("login.me")
	public ModelAndView loginUser(Users m, HttpSession session, ModelAndView mv){
	
		Users loginUser = uService.loginUser(m);
		
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
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
}
