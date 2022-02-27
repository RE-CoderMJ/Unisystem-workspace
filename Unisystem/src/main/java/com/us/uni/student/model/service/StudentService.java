package com.us.uni.student.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.users.model.vo.Users;

public interface StudentService {

	// 1. 관리자 - 학생 리스트 조회
	int selectListCount();
	ArrayList<Users> selectStudentList(PageInfo pi);
	
	// 학생페이지 - 개인정보 조회
	Users StudentInfo(int studNo);
	
	// 2. 학생 검색
	ArrayList<Users> selectDepartment(String studUniv);
	int selectSearchCount(HashMap map);
	ArrayList<Users> searchStudent(HashMap map, PageInfo pi);
	
	// 3. 학생 삭제
	int studentDelete(String dno);
	
	// 4. 학생 등록
	int studentInsert(Users student);
	
	// 학생 정보 변경
	int studentUpdateInfo(Users student)
}
