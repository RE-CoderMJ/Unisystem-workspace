package com.us.uni.message.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.message.model.vo.Message;


@Repository
public class MessageDao {

	public int selectMsgListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("messageMapper.recSelectListCount", userNo);
	}

	public ArrayList<Message> selectMsgList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);

		return (ArrayList)sqlSession.selectList("messageMapper.recSelectList", userNo, rowBounds);
	}

	public int SendMsgListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("messageMapper.sendSelectListCount", userNo);
	}

	public ArrayList<Message> SendMsgList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.sendSelectList", userNo, rowBounds);
	}
	
	
}