package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.lecture.model.dao.HomeworkDao;
import com.us.uni.lecture.model.dao.LectureDao;
import com.us.uni.lecture.model.vo.Lecture;

@Service
public class LectureServiceImpl implements LectureService{
	
	// 학생 - 마이페이지 - 내가 수강중인 강의 관련 
	// 강의 메인페이지
	
	@Autowired
	private LectureDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	public ArrayList<Lecture> selectStudentClassList(int userNo) {
		return lDao.selectStudentClassList(sqlSession, userNo);
	}
	
	@Override
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	public ArrayList<Lecture> selectStudentSearchClassList(Lecture l) {
		return lDao.selectStudentSearchClassList(sqlSession, l);
	}
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	@Override
	public ArrayList<Lecture> selectYearList() {
		return lDao.selectYearList(sqlSession);
	}

	// 학생 - 마이페이지 - 내가 수강중인 강의 관련 
	// 강의 메인페이지
	

	
}
