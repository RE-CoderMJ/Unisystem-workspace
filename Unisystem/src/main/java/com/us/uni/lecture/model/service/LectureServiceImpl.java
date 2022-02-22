package com.us.uni.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.dao.LectureDao;
import com.us.uni.lecture.model.vo.Homework;
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
	
	// 출결 -------------------------------------------------------------

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

	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(출석)
	@Override
	public int SelectAttStaListA(Lecture l) {
		return lDao.SelectAttStaListA(sqlSession, l);
	}
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(결석)
	@Override
	public int SelectAttStaListB(Lecture l) {
		return lDao.SelectAttStaListB(sqlSession, l);
	}
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(지각)
	@Override
	public int SelectAttStaListC(Lecture l) {
		return lDao.SelectAttStaListC(sqlSession, l);
	}

	// 교수 - 마이페이지 - 진행강의 조회 리스트 조회
	@Override
	public ArrayList<Lecture> selectProfessorClassList(int userNo) {
		return lDao.selectProfessorClassList(sqlSession, userNo);
	}

	// 교수 - 마이페이지 - 진행강의조회 : 원하는 년도, 학기에 따라 강의 리스트 조회
	@Override
	public ArrayList<Lecture> SelectProfessorSearchClassList(Lecture l) {
		return lDao.SelectProfessorSearchClassList(sqlSession, l);
	}
	
	// 교수 - 강의페이지 - 출결관리 - 진행한 강의 총 개수 조회
	@Override
	public int selectProAttListCount(Lecture l) {
		return lDao.selectProAttListCount(sqlSession, l);
	}
	
	// 교수 - 강의페이지 - 출결관리 - 진행한 강의 리스트 조회
	@Override
	public ArrayList<Lecture> selectProAttList(PageInfo pi, Lecture l) {
		return lDao.selectProAttList(sqlSession, pi, l);
	}

	// 교수 - 강의페이지 - 출결관리 - 출결관리 상세
	@Override
	public ArrayList<Lecture> selectAttDetail(Lecture l) {
		return lDao.selectAttDetail(sqlSession, l);
	}

	// 교수 - 출결관리 - 해당 강의를 듣는 학생 목록 조회
	@Override
	public ArrayList<Lecture> AjaxSelectselectAttStuList(int classCode) {
		return lDao.AjaxSelectselectAttStuList(sqlSession, classCode);
	}

	// 교수 - 출결관리상세(출결등록창)에서 학생 출결을 등록
	@Override
	public int insertAtt(Lecture l, ArrayList<Lecture> studNoList) {
		return lDao.insertAtt(sqlSession, l, studNoList);
	}

	// 교수 - 출결관리상세 - 학생들의 출결상태를 INSERT하는 컨트롤러
	@Override
	public int insertAttStatus(Lecture l, ArrayList<Lecture> studInfo) {
		return lDao.insertAttStatus(sqlSession, l, studInfo);
	}

	
	// 과제 -------------------------------------------------------------

	
	// 마감된 과제 리스트의 게시글 총 수를 조회
	@Override
	public int selectHomeworkListCount(int classNo) {
		return lDao.selectHomeworkListCount(sqlSession, classNo);
	}

	// 마감된 과제 리스트 페이지 조회
	@Override
	public ArrayList<Lecture> selectHomeworkpList(PageInfo pi, int classNo) {
		return lDao.selectHomeworkpList(sqlSession, pi, classNo);
	}

	/* 학생 - 과제업로드 : 마감상태 게시글리스트에서 제출상태, 채점상태, 점수를 조회 */
	@Override
	public ArrayList<Homework> selectIStuHomeworkInfo(Homework h, List<String> tdArr) {
		return lDao.selectIStuHomeworkInfo(sqlSession, h, tdArr);
	}
	

	
}
