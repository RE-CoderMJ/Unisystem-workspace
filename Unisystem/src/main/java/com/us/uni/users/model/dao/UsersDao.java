package com.us.uni.users.model.dao;


import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.users.model.vo.Users;

@Repository
public class UsersDao {
	
	private SqlSessionTemplate sqlSession;
	
	public Users loginUser(SqlSessionTemplate sqlSession, Users m) {
		return sqlSession.selectOne("usersMapper.loginUser",m);
	}
	
	public Users findId(SqlSessionTemplate sqlSession, Users m) {
		
		Users uu = sqlSession.selectOne("usersMapper.findId", m);
		
		//System.out.println(uu);

		return sqlSession.selectOne("usersMapper.findId", m);
	}
	
	public Users findpwd(SqlSessionTemplate sqlSession, Users userNo) {
		
		Users uu = sqlSession.selectOne("usersMapper.findpwd", userNo);
		
		return sqlSession.selectOne("usersMapper.findpwd", userNo);
	}

	
	//error
	public int updatePwd(SqlSessionTemplate sqlSession, Users m){
			
			int result = 0;
			
			result = sqlSession.update("usersMapper.resetPwd",m);
			System.out.println(result);
			
			return sqlSession.update("usersMapper.resetPwd",m);
	}
	
	public int idCheck(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("usersMapper.idCheck",userNo);
	}
			
	
	 

	

	
	
}
