package com.us.uni.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.message.model.vo.Message;

/*
@Repository
public class MessageDao {

	public int recSelectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("MessageMapper.recSelectListCount");
	}

	public ArrayList<Message> recSelectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		
		
		return (ArrayList)sqlSession.selectList("MessageMapper.recSelectList", null, rowBounds);
	}

}
*/