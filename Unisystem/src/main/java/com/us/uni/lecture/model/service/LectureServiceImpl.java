package com.us.uni.lecture.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.dao.HomeworkDao;
import com.us.uni.lecture.model.dao.LectureDao;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Service
public class LectureServiceImpl implements LectureService{
	
	// 학생 - 마이페이지 - 내가 수강중인 강의 관련 
	// 강의 메인페이지
	
	@Autowired
	private LectureDao lDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	// 4. 학생 - 강의홈 - 내가 수강중인 강의 리스트 조회
	public ArrayList<Lecture> selectStudentClassList(int userNo) {
		return lDao.selectStudentClassList(sqlSession, userNo);
	}
	
	@Override
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	public ArrayList<Lecture> selectStudentSearchClassList(Lecture l) {
		return lDao.selectStudentSearchClassList(sqlSession, l);
	}
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	@Override
	public ArrayList<Lecture> selectYearList() {
		return lDao.selectYearList(sqlSession);
	}
	
	// 5. 학생 - 강의홈 - 내가수강중인강의에서 클릭한 강의 정보 조회(강의명, 교수명)
	@Override
	public Lecture selectLectureMainPage(int lno) {
		return lDao.selectLectureMainPage(sqlSession, lno);
	}

	// 6. 학생 - 강의홈 - 온라인 출석부 - 로그인한 학생 정보 조회 (학번, 이름, 휴대전화)
	@Override
	public Users selectLoginStuInfo(int userNo) {
		return lDao.selectLoginStuInfo(sqlSession, userNo);
	}
	
	// 7. 학생 - 강의홈 - 온라인 출석부 - 진행한 강좌 총 개수 조회
	@Override
	public int selectAttListCount(Lecture l) {
		return lDao.selectAttListCount(sqlSession, l);
	}

	// 8. 학생 - 강의홈 - 온라인 출석부 - 선택한 강좌의 진행한 강좌리스트 조회
	@Override
	public ArrayList<Lecture> selectAttList(PageInfo pi, Lecture l) {
		return lDao.selectAttList(sqlSession, pi, l);
	}


	

	
}
