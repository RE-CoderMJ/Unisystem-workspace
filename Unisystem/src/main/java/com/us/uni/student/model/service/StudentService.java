package com.us.uni.student.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.users.model.vo.Users;

public interface StudentService {

	// 1. 학생 리스트 조회
	int selectListCount();
	ArrayList<Users> selectStudentList(PageInfo pi);
	
	
	// 2. 학생 검색
	ArrayList<Users> selectDepartment(String studUniv);
	int selectSearchCount(HashMap map);
	ArrayList<Users> searchStudent(HashMap map, PageInfo pi);
	
	// 3. 학생 삭제
	int studentDelete(String dno);
}
