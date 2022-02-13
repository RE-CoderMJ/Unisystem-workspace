package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.dao.HomeworkDao;
import com.us.uni.lecture.model.vo.HomeworkP;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Service
public class HomeworkServiceImpl implements HomeworkService{
	
	@Autowired
	private HomeworkDao hDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	@Override
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	public ArrayList<Lecture> selectStudentClassList(int userNo) {
		return hDao.selectStudentClassList(sqlSession, userNo);
	}
	
	@Override
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	public ArrayList<Lecture> selectStudentSearchClassList(Lecture l) {
		return hDao.selectStudentSearchClassList(sqlSession, l);
	}
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	@Override
	public ArrayList<Lecture> selectYearList() {
		return hDao.selectYearList(sqlSession);
	}
	
	@Override
	public int selectHomeworkListCount() {
		return hDao.selectHomeworkListCount(sqlSession);
	}
	/*
	@Override
	public ArrayList<HomeworkP> selectHomeworkpList(PageInfo pi) {
		return ;
	*/




}
