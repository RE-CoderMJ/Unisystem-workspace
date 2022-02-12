package com.us.uni.lecture.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.HomeworkP;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Repository
public class HomeworkDao {
	
	public ArrayList<Lecture> selectStudentClassList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectStudentClassList", userNo);
	}
	
	public int selectHomeworkListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("lectureMapper.selectHomeworkListCount");
	}
	
	public ArrayList<Lecture> selectYearList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectYearList");
	}
	
	
	/*
	public int selectHomeworkpList(SqlSessionTemplate sqlSession, PageInfo pi){
		return ;

	public String selectHomeworkpList(SqlSessionTemplate sqlSession, PageInfo pi){
		return "";
	}
	*/
	
}
