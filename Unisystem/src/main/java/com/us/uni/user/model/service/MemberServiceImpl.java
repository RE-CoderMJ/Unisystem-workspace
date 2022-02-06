package com.us.uni.user.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.user.model.dao.MemberDao;
import com.us.uni.user.model.vo.Member;


@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao uDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginUser(Member m) {
		
		Member loginUser = uDao.loginUser(sqlSession,m);
		return loginUser;
	}

}
