package com.us.uni.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.message.model.dao.MessageDao;
import com.us.uni.message.model.vo.Message;


@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectMsgListCount(int userNo) {
		
		return mDao.selectMsgListCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Message> selectMsgList(PageInfo pi, int userNo) {
		
		return mDao.selectMsgList(sqlSession,pi,userNo);
	}

	@Override
	public int sendMsgListCount(int userNo) {
		
		return mDao.sendMsgListCount(sqlSession,userNo);
	}

	@Override
	public ArrayList<Message> sendMsgList(int userNo, PageInfo pi) {
		
		return mDao.sendMsgList(sqlSession,userNo,pi);
	}

	

}