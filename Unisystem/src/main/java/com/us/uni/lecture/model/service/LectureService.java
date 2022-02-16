package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

public interface LectureService {
	
	// 학생 - 마이페이지 - 내가 수강중인 강의 관련 
	// 강의 메인페이지

	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	// 4. 학생 - 강의홈 - 내가 수강중인 강의 리스트 조회
	ArrayList<Lecture> selectStudentClassList(int userNo);
	
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	ArrayList<Lecture> selectStudentSearchClassList(Lecture l);
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	ArrayList<Lecture> selectYearList();
	
	// 5. 학생 - 강의홈 - 내가수강중인강의에서 클릭한 강의 정보 조회(강의명, 교수명)
	Lecture selectLectureMainPage(int lno);
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(출석)
	int SelectAttStaListA(Lecture l);
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(결석)
	int SelectAttStaListB(Lecture l);
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(지각)
	int SelectAttStaListC(Lecture l);
	
	// 6. 학생 - 강의홈 - 온라인 출석부 - 로그인한 학생 정보 조회 (학번, 이름, 휴대전화)
	Users selectLoginStuInfo(int userNo);
	
	// 7. 학생 - 강의홈 - 온라인 출석부 - 진행한 강좌 총 개수 조회
	int selectAttListCount(Lecture l);
	
	// 8. 학생 - 강의홈 - 온라인 출석부 - 선택한 강좌의 진행한 강좌리스트 조회
	ArrayList<Lecture> selectAttList(PageInfo pi, Lecture l);
	
	// 교수 - 마이페이지 - 진행강의 조회 리스트 조회
	ArrayList<Lecture> selectProfessorClassList(int userNo);
	
	// 교수 - 마이페이지 - 진행강의조회 : 원하는 년도, 학기에 따라 강의 리스트 조회
	ArrayList<Lecture> SelectProfessorSearchClassList(Lecture l);
}


