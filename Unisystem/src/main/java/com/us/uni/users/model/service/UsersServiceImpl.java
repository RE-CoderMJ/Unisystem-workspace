package com.us.uni.users.model.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.us.uni.users.model.dao.UsersDao;
import com.us.uni.users.model.vo.Users;

@Service
public class UsersServiceImpl implements UsersService{
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private UsersDao uDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Users loginUser(Users m) {
		
		Users loginUser = uDao.loginUser(sqlSession,m);
		
		return loginUser;
	}
	
	@Override
	public Users findId(Users m) {
		Users findId = uDao.findId(sqlSession,m);
		
		return findId;
		
	}

	@Override
	public Users findpwd(Users m) {
		Users findpwd = uDao.findpwd(sqlSession,m);
		
		return findpwd;
	}

	//비밀번호찾기
	@Override
	public void findPwd(HttpServletResponse response, Users m) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		
		Users us = uDao.loginUser(sqlSession, m);
		//System.out.println(us);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(m.getUserNo() != us.getUserNo()) {
			
			out.println("<script>alert('가입된 아이디가 아닙니다.'); location.href='../uni';</script>");
			out.flush();
			
		}
		// 가입된 이메일이 아니면
		else if(!m.getEmail().equals(us.getEmail())) {
			out.println("<script>alert('등록되지 않은 이메일입니다.'); location.href='../uni';</script>");
			//out.print("등록되지 않은 이메일입니다.");
			out.flush();
		}else {
			// 임시 비밀번호 생성
			String userPwd = "";
			for (int i = 0; i < 12; i++) {
				userPwd += (char) ((Math.random() * 26) + 97);
			}
			
			m.setUserPwd(userPwd);
			
			// 비밀번호 변경  //error
		
			uDao.updatePwd(sqlSession,m);
			
			
			// 비밀번호 변경 메일 발송
			sendEmail(m, m.getEmail());
			out.println("<script>alert('이메일로 임시 비밀번호를 발송하였습니다.'); location.href='../uni';</script>");
			//out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			//out.close();
			out.flush();
			}
		}
 

		@Autowired
		private MailSender mailSender;
		
		public void sendEmail(Users m, String div){
			
			// Mail Server 설정
			String charSet = "utf-8";
			String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
			String hostSMTPid = "sekoongLee@gmail.com";
			String hostSMTPpwd = "xmxzudrhfbcjksgd";
				
			// 보내는 사람 EMail, 제목, 내용
			String fromEmail = "sekoongLee@gmail.com";
			String fromName = "UNISYSTEM";
			String subject = "";
			String msg = "";
			
			subject = "UNI SYSTEM 임시 비밀번호 입니다.";
			msg += m.getUserNo()+ "님의 임시 비밀번호 입니다.\n비밀번호를 변경하여 사용하세요.\n";
			msg += "임시 비밀번호 :";
			msg += m.getUserPwd()+"\n";
			msg += "http://localhost:8009/uni 에서 로그인 후 비밀번호를 변경해주세요.";
						
			SimpleMailMessage smm = new SimpleMailMessage();
			smm.setFrom(fromEmail);
			smm.setTo(m.getEmail());
			smm.setSubject(subject);
			smm.setText(msg);
			
			mailSender.send(smm);
			
			String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
			m.setUserPwd(encPwd);
			
			int result = uDao.updatePwd(sqlSession,m);
			
			//System.out.println(result);
		}
	}
	

	
	

	


