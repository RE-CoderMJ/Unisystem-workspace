package com.us.uni.mail.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.vo.MailFrom;

@Repository
public class MailDao {

	public int saveDraft(SqlSessionTemplate sqlSession, MailFrom mf) {

		return sqlSession.insert("mailMapper.saveDraft", mf);
	}

	public int selectDraftListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("mailMapper.selectDraftListCount", userNo);
	}

	public ArrayList<MailFrom> selectDraftList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectDraftList", userNo, rowBounds);
	}

	public MailFrom selectDraft(SqlSessionTemplate sqlSession, int mfNo) {
		
		return sqlSession.selectOne("mailMapper.selectDraft", mfNo);
	}

}
