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

	public ArrayList<Message> selectMsgList(SqlSessionTemplate sqlSession, PageInfo pi , int userNo) {

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset,limit);

		return (ArrayList)sqlSession.selectList("messageMapper.recSelectList", userNo, rowBounds);
	}

	public int sendMsgListCount(SqlSessionTemplate sqlSession, int userNo) {
		
		return sqlSession.selectOne("messageMapper.sendSelectListCount", userNo);
	}

	public ArrayList<Message> sendMsgList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("messageMapper.sendSelectList", userNo, rowBounds);
	}

	public int sendMessage(SqlSessionTemplate sqlSession, Message msg) {
		
		return sqlSession.insert("messageMapper.sendMessage",msg);
	}

	public int readDate(SqlSessionTemplate sqlSession, int messageNo) {
		
		return sqlSession.update("messageMapper.readDate",messageNo);
	}

	public Message rdetailMsg(SqlSessionTemplate sqlSession, int messageNo) {
		
		return sqlSession.selectOne("messageMapper.rdetailMsg",messageNo);
	}

	public Message sdetailMsg(SqlSessionTemplate sqlSession, int messageNo) {
		
		return sqlSession.selectOne("messageMapper.sdetailMsg",messageNo);
	}

	public int deleteMsg(SqlSessionTemplate sqlSession, Message m) {
		
		return sqlSession.update("messageMapper.deleteMsg",m);
	}
	
}