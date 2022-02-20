package com.us.uni.professor.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.users.model.vo.Users;

public interface ProfessorService {
	
	// 교수 리스트 조회
	int selectListCount();
	ArrayList<Users> selectProfessorList(PageInfo pi);
	// 대학별 학부별 조회
	ArrayList<Users> selectDepartment(String profUniv);
	// 교수 검색
	// 교수 삭제
	// 교수 등록
	
	

}
