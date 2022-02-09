package com.us.uni.users.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.users.model.service.UsersService;
import com.us.uni.users.model.vo.Users;


@Controller
public class UsersController {
	
	@Autowired
	private UsersService uService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@GetMapping("enview")
	public ModelAndView find() {
		return new ModelAndView ("common/portalmain");
	}
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView loginUser(Users m,HttpSession session, ModelAndView mv){
	
		Users loginUser = uService.loginUser(m);
		//String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		
		//System.out.println("평문:" + m.getUserPwd());
		//System.out.println("암호문:"+ encPwd);
		
		//m.setUserPwd(encPwd);
	
		if(loginUser != null || bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.addObject("alertMsg", "로그인 성공");
			mv.setViewName("redirect:enview");
			
		} else {
			// 로그인 실패
			
			mv.addObject("alertMsg", "로그인 실패");
			mv.setViewName("common/errorPage"); 
		}
		
		return mv;	
	}
	
	
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	//아이디찾기
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
	
		 
		/* 비밀번호 찾기 form */
		@GetMapping("pwdForm")
		public ModelAndView findPwForm() {
			return new ModelAndView ("common/pwdFind");
		}
		
		
		/* 비밀번호 찾기 */
		@RequestMapping(value = "/pwdFind", method = RequestMethod.GET)
		public void findPwGET() throws Exception{
		}

		@RequestMapping(value = "/pwdFind", method = RequestMethod.POST)
		public void findPwPOST(@ModelAttribute Users m, HttpServletResponse response) throws Exception{
			uService.findPwd(response, m);
		}
		
		
		//아이디와 이메일이 같으면 특정한 메일이 가게..
		@RequestMapping("/pwdFind")
		public ModelAndView sendEmail(Users m, String email) throws Exception {
			ModelAndView mv = new ModelAndView();
						
			uService.sendEmail(m, email);
			
			mv.setViewName("/mainPage");
			return mv;
		}
			
	
		}
		

	

	
	
	 