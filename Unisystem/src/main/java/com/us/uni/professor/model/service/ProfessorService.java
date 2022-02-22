package com.us.uni.professor.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

public interface ProfessorService {
	
	// 교수 리스트 조회
	int selectListCount();
	ArrayList<Users> selectProfessorList(PageInfo pi);
	// 대학별 학부별 조회
	ArrayList<Users> selectDepartment(String profUniv);
	// 교수 검색
	int selectSearchCount(HashMap map);
	ArrayList<Users> searchProfessor(HashMap map, PageInfo pi);
	// 교수 삭제
	int professorDelete(String dno);
	// 교수 등록
	
	// 강의 개설
	int classInsert(Lecture lec);
	int classInsertAtt(HashMap map);
	
	

}
