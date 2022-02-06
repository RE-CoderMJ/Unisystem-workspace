package com.us.uni.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.users.model.vo.Users;

@Repository
public class UsersDao {
	
	public Users loginUser(SqlSessionTemplate sqlSession, Users m) {
		return sqlSession.selectOne("memberMapper.loginUser",m);
	}

}
