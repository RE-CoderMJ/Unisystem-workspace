package com.us.uni.lecture.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.dao.LectureDao;
import com.us.uni.lecture.model.vo.Classboard;
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
	public int selectHomeworkListCount(Homework h) {
		return lDao.selectHomeworkListCount(sqlSession, h);
	}

	// 학생 - 과제업로드 : 마감된 과제 리스트 페이지 조회
	@Override
	public ArrayList<Lecture> selectHomeworkpList(PageInfo pi, Homework h) {
		return lDao.selectHomeworkpList(sqlSession, pi, h);
	}

	// 학생 - 과제업로드 : 제출가능상태의 총 게시글 리스트 조회
	@Override
	public ArrayList<Homework> selectPhomeworkList(Homework h) {
		return lDao.selectPhomeworkList(sqlSession, h);
	}
	
	// 교수 - 과제관리 : 마감된 과제 리스트 페이지 조회
	@Override
	public ArrayList<Homework> selectProHomeworkEndList(PageInfo pi, Homework h) {
		return lDao.selectProHomeworkEndList(sqlSession, pi, h);
	}

	// 교수 - 과제관리 : 제출가능상태의 총 게시글 리스트 조회
	@Override
	public ArrayList<Homework> selectProhomeworkList(Homework h) {
		return lDao.selectProhomeworkList(sqlSession, h);
	}

	// 교수 - 과제관리 : 과제등록
	@Override
	public int insertHomeworkEnrollForm(Homework h, Attachment at) {	
		
		int result1 = lDao.insertHomeworkEnrollForm(sqlSession, h);
		
		if(at.getOriginName() != null) {
			
			int result2 = lDao.insertAttachPHomework(sqlSession, at);

			return result1*result2;
		}
		
		return result1;
	}
	
	// 교수 - 과제관리 : 상세페이지 조회 (제출가능한 과제 상세페이지)
	@Override
	public Homework selectProHomework(Homework h) {
		return lDao.selectProHomework(sqlSession, h);
	}
	
	// 교수 - 과제관리 : 상세페이지 조회 (마감된 과제 상세페이지)
	@Override
	public Homework selectProHomeworkI(Homework h) {
		return lDao.selectProHomeworkI(sqlSession, h);
	}

	// 교수 - 과제관리 : 상세페이지 조회 (상단의 교수가 낸 과제 상세페이지에 필요한 첨부파일)
	@Override
	public Attachment selectAttachHomework(Homework h) {
		return lDao.selectAttachHomework(sqlSession, h);
	}

	// 교수 - 과제관리 : '과제마감'버튼 클릭을 통해 제출가능한과제 상태를 마감상태로 변경
	@Override
	public int updatepHomeworkStatus(Homework h) {
		return lDao.updatepHomeworkStatus(sqlSession, h);
	}

	// 교수 - 과제관리 : '수정'버튼을 통해 기존의 교수가 낸 과제를 수정
	@Override
	public int updateProHomework(Homework h) {
		return lDao.updateProHomework(sqlSession, h);
	}

	// 교수 - 과제관리 : '수정'버튼을 통해 기존의 교수가 낸 과제의 첨부파일을 수정
	@Override
	public int updateProHwAtt(Attachment at) {
		return lDao.updateProHwAtt(sqlSession, at);
	}

	// 교수 - 과제관리 : '수정'버튼을 통해 기존의 교수가 낸 과제의 첨부파일을 수정(기존에 파일 x)
	@Override
	public int insertNewAtt(Attachment at) {
		return lDao.insertNewAtt(sqlSession, at);
	}

	// 교수 - 과제관리 : 상세페이지의 '삭제'버튼을 통해 게시글 삭제
	@Override
	public int deleteProHomework(Homework h) {
		return lDao.deleteProHomework(sqlSession, h);
	}

	// 교수 - 과제관리 : 상세페이지의 '삭제'버튼을 통해 게시글에 딸린 첨부파일 삭제
	@Override
	public int deleteAttachProHomework(Homework h) {
		return lDao.deleteAttachProHomework(sqlSession, h);
	}

	// 학생 - 과제업로드 : 제출가능한 과제 상세페이지 조회
	@Override
	public Homework selectStuHomeworkP(Homework h) {
		return lDao.selectStuHomeworkP(sqlSession, h);
	}

	// 학생 - 과제업로드 : 제출가능한 과제에서 과제 등록 
	@Override
	public int insertStuHomeworkEnrollForm(Homework h, Attachment at) {
		int result1 = lDao.insertStuHomeworkEnrollForm(sqlSession, h);
		
		if(at.getOriginName() != null) {
			
			int result2 = lDao.insertStuAttachPHomework(sqlSession, at);

			return result1*result2;
		}
		
		return result1;
	}

	// 학생 - 과제업로드 : 제출가능한 과제 제출 후 해당 부분 조회 
	@Override
	public Homework selectStuHomeworkDetail(Homework h) {
		return lDao.selectStuHomeworkDetail(sqlSession, h);
	}

	// 학생 - 과제업로드 : 제출가능한 과제 제출 후 해당 부분 첨부파일 조회
	@Override
	public Attachment selectStuAttachHomework(Homework h) {
		return lDao.selectStuAttachHomework(sqlSession, h);
	}

	//자료실 리스트 갯수 조회 
	@Override
	public int selectLectureDataListCount(int classNo) {
		
		return lDao.selectLectureDataListCount(sqlSession, classNo);
	}

	//자료실 리스트 조회 
	@Override
	public  ArrayList<Classboard> selectLectureDataList(int classNo, PageInfo pi) {
		
		return lDao.selectLectureDataList(sqlSession, classNo, pi);
	}

	@Override
	public int increaseMatCount(int bno) {
		
		return  lDao.increaseMatCount(sqlSession, bno);
	}

	@Override
	public Classboard selectLectureMaterialDetail(int bno) {
		
		return lDao.selectLectureMaterialDetail(sqlSession,bno);
	}

	@Override
	public Attachment selectAttachMaterial(int bno) {
		
		return lDao.selectAttachMaterial(sqlSession,bno);
	}


	
}
