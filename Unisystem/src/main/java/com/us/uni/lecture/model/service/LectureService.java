package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import com.us.uni.lecture.model.vo.Lecture;

public interface LectureService {
	
	// 학생 - 마이페이지 - 내가 수강중인 강의 관련 
	// 강의 메인페이지

	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	ArrayList<Lecture> selectStudentClassList(int userNo);
	
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	ArrayList<Lecture> selectStudentSearchClassList(Lecture l);
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	ArrayList<Lecture> selectYearList();

}
