package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.HomeworkP;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

public interface HomeworkService {
	
	
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	ArrayList<Lecture> selectStudentClassList(int userNo);
	
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	ArrayList<Lecture> selectStudentSearchClassList(Lecture l);
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	ArrayList<Lecture> selectYearList();
	
	// 학생 : 과제업로드 - 게시판 리스트 페이징
	int selectHomeworkListCount();
	// 학생 : 과제업로드 - 마감된 게시판 리스트 가져오기(조회)
	/*
	ArrayList<HomeworkP> selectHomeworkpList(PageInfo pi);
	*/
}
