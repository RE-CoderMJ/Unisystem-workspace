package com.us.uni.message.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.message.model.vo.Message;
/*
@Service
public class MessageServiceImpl implements MessageService{

	@Autowired
	private MessageDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int recSelectListCount() {
		
		return mDao.recSelectListCount(sqlSession);
	}

	@Override
	public ArrayList<Message> recSelectList(PageInfo pi) {
		
		return mDao.recSelectList(sqlSession,pi);
	}

}
*/