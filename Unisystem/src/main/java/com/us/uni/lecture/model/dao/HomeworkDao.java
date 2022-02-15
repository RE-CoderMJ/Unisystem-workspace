package com.us.uni.lecture.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.lecture.model.vo.Lecture;

@Repository
public class HomeworkDao {
	
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
