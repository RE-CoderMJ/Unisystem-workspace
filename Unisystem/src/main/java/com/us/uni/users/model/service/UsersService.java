package com.us.uni.users.model.service;

import javax.servlet.http.HttpServletResponse;

import com.us.uni.users.model.vo.Users;

public interface UsersService {
	
	// 로그인 서비스 (select)
	Users loginUser(Users m);
	Users findId(Users m);
	Users findpwd(Users m);
	
	//이메일발송
	//public void sendEmail(Users m, String div) throws Exception;

	//비밀번호찾기
	void findPwd(HttpServletResponse response, Users m) throws Exception;
	void sendEmail(Users m, String email);

}
