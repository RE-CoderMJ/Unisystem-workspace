package com.us.uni.users.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.users.model.service.UsersService;
import com.us.uni.users.model.vo.Users;


@Controller
public class UsersController {
	
	@Autowired
	private UsersService uService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 로그인
		@RequestMapping("loginMain")
		public String loginMain() {
			
			return "common/userLogin";
		}
		
	//portal메인
	@GetMapping("enview")
	public ModelAndView find() {
		return new ModelAndView ("common/portalmain");
	}
	
	
	// 로그인
	@RequestMapping("login.me")
	public ModelAndView loginUser(Users m, HttpSession session, ModelAndView mv, Model model){
	
		//System.out.println(m);

		Users loginUser = uService.loginUser(m);
		
		System.out.println(loginUser.getUserPwd());
		
		//String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println("평문:" + m.getUserPwd());
		//System.out.println("암호문:"+ encPwd);
		//m.setUserPwd(encPwd);
		
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			
			// 로그인 성공
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:enview");
			
		} else {
			// 로그인 실패
			model.addAttribute("alertMsg", "일치하는 회원정보가 없습니다.");
			mv.setViewName("common/mainPage"); 
		}
		return mv;	
	}
	
		
	
	/*관리자 로그인페이지*/
	@GetMapping("adminEnview")
	public ModelAndView adminLogin() {
		return new ModelAndView ("admin/adminLogin");
	}
	
	
	// 로그아웃
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	//id search
		@RequestMapping("findid.me")
		public String id() {
		 
			return "common/idFind";
		}
	
	
	//아이디찾기
	@RequestMapping("findid")
	public String findId(Users m, HttpSession session, Model model) {
		
		Users findId = uService.findId(m);
		System.out.println(m);
		
		//String dateDob = String.join("", findId.getBirthday().substring(2,10).split("-"));
	
		if(findId.getKorName().equals(m.getKorName()) && findId.getPhone().equals(m.getPhone()) && findId.getBirthday().equals(m.getBirthday())) {
			
			session.setAttribute("alertMsg", String.format("로그인 아이디는 %s 입니다.", findId.getUserNo()));
			return "common/mainPage";
		} else {
			model.addAttribute("alertMsg", "일치하는 회원정보가 없습니다.");
			return "common/mainPage";
		}
		
	}
	
		 
		/* 비밀번호 찾기 form */
		@GetMapping("findpwd")
		public ModelAndView findPwForm() {
			return new ModelAndView ("common/pwdFind");
		}
		
		
		/* 비밀번호 찾기 
		@GetMapping("pwdFind")
		public ModelAndView pwdfind() {
			return new ModelAndView ("common/pwdFind");
		}
*/
		
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
		

	

	
	
	 