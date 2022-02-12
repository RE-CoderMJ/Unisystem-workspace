package com.us.uni.mail.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.mail.model.vo.MailFrom;

@Repository
public class MailDao {

	public int saveDraft(SqlSessionTemplate sqlSession, MailFrom mf) {

		return sqlSession.insert("mailMapper.saveDraft", mf);
	}

}
