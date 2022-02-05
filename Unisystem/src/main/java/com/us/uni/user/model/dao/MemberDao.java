package com.us.uni.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.user.model.vo.Member;

@Repository
public class MemberDao {
	
	public Member loginUser(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.selectOne("memberMapper.loginUser",m);
	}

}
