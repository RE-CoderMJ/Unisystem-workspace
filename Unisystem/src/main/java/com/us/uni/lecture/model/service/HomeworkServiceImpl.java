package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.dao.HomeworkDao;
import com.us.uni.lecture.model.vo.HomeworkP;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	
	@Autowired
	private HomeworkDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int selectHomeworkListCount() {
		return hDao.selectHomeworkListCount(sqlSession);
	}

	@Override
	public ArrayList<HomeworkP> selectHomeworkpList(PageInfo pi) {
		return hDao.selectHomeworkpList(sqlSession, pi);
	}
}