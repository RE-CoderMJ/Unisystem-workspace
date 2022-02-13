package com.us.uni.lecture.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.lecture.model.vo.Lecture;

@Repository
public class HomeworkDao {
	
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	public ArrayList<Lecture> selectStudentClassList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectStudentClassList", userNo);
	}
	
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	public ArrayList<Lecture> selectStudentSearchClassList(SqlSessionTemplate sqlSession, Lecture l){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectStudentSearchClassList", l);
	}
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	public ArrayList<Lecture> selectYearList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectYearList");
	}

	
	
	public int selectHomeworkListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.selectHomeworkListCount");
	}
	/*
	public int selectHomeworkpList(SqlSessionTemplate sqlSession, PageInfo pi){
		return ;

	public String selectHomeworkpList(SqlSessionTemplate sqlSession, PageInfo pi){
		return "";
	}
	*/
	
}
