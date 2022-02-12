package com.us.uni.student.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.student.model.vo.Student;

public interface StudentService {

	// 1. 학생 리스트 조회
	int selectListCount();
	ArrayList<Student> selectStudentList(PageInfo pi);
	
	
	// 2. 검색
	ArrayList<Student> selectDepartment(String studUniv);
	int selectSearchCount(HashMap map);
	ArrayList<Student> searchStudent(HashMap map, PageInfo pi);
}
