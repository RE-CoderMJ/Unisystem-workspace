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
	public ModelAndView loginUser(Users m,HttpSession session, ModelAndView mv){
	
		Users loginUser = uService.loginUser(m);
		//String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		//System.out.println("평문:" + m.getUserPwd());
		//System.out.println("암호문:"+ encPwd);
		
		//m.setUserPwd(encPwd);
	
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.addObject("alertMsg", "로그인 성공");
			mv.setViewName("redirect:/");
			
		} else {
			// 로그인 실패
			
			mv.addObject("alertMsg", "로그인 실패");
			mv.setViewName("common/errorPage"); 
		}
		
		return mv;	
	}
	
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	/**/
	
	@RequestMapping("findid")
	public ModelAndView findId(Users m, HttpSession session, ModelAndView mv) {
		
		//System.out.println(m);
		
		Users findId = uService.findId(m);
		
		//String dateDob = String.join("", findId.getBirthday().substring(2,10).split("-"));
	
	
		if(findId.getKorName().equals(m.getKorName()) && findId.getPhone().equals(m.getPhone()) && findId.getBirthday().equals(m.getBirthday())) {
			
			mv.addObject("alertMsg", String.format("로그인 아이디는 %s 입니다.", findId.getUserNo()));
			mv.setViewName("common/mainPage");
			
		} else {
			mv.addObject("alertMsg", "일치하는 회원정보가 없습니다.");
			mv.setViewName("common/mainPage");
		}
		
		return mv; 
	}
	
}
