package com.us.uni.users.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.users.model.vo.Users;

@Repository
public class UsersDao {
	
	public Users loginUser(SqlSessionTemplate sqlSession, Users m) {
		return sqlSession.selectOne("usersMapper.loginUser",m);
	}
	
	public Users findId(SqlSessionTemplate sqlSession, Users m) {
		
		Users uu = sqlSession.selectOne("usersMapper.findId", m);
		
		System.out.println(uu);

		return sqlSession.selectOne("usersMapper.findId", m);
	}

}
