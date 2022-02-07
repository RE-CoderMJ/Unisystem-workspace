package com.us.uni.users.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.users.model.dao.UsersDao;
import com.us.uni.users.model.vo.Users;


@Service
public class UsersServiceImpl implements UsersService{
	
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

}
