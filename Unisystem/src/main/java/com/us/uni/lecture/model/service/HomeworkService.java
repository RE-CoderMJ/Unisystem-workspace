package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.HomeworkP;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

public interface HomeworkService {
	
	
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	ArrayList<Lecture> selectStudentClassList(int userNo);
	
	// 학생 : 과제업로드 - 게시판 리스트 페이징
	int selectHomeworkListCount();
	// 학생 : 과제업로드 - 마감된 게시판 리스트 가져오기(조회)
	/*
	ArrayList<HomeworkP> selectHomeworkpList(PageInfo pi);
	*/
}
