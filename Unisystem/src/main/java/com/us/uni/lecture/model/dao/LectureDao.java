package com.us.uni.lecture.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.Classboard;
import com.us.uni.lecture.model.vo.Homework;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Repository
public class LectureDao {
	
	// 학생 - 마이페이지 - 내가 수강중인 강의 관련 
	// 강의 메인페이지
	
	// 1. 학생 - 마이페이지 - 내가 수강중인 강의 리스트 조회
	public ArrayList<Lecture> selectStudentClassList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectStudentClassList", userNo);
	}
	
	// 2. 학생 - 마이페이지 - 내가수강중인 강의 : 원하는 년도, 학기에 따라 강의 리스트 조회
	public ArrayList<Lecture> selectStudentSearchClassList(SqlSessionTemplate sqlSession, Lecture l){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectStudentSearchClassList", l);
	}
	
	// 3. 학생 - 마이페이지 - 내가수강중인 강의 : 년도값을 가져오는 리스트 조회
	public ArrayList<Lecture> selectYearList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectYearList");
	}
	
	// 5. 학생 - 강의홈 - 내가수강중인강의에서 클릭한 강의 정보 조회(강의명, 교수명)
	public Lecture selectLectureMainPage(SqlSessionTemplate sqlSession, int lno) {
		return sqlSession.selectOne("lectureMapper.selectLectureMainPage", lno);
	}
	
	// 출결 ----------------------------------------------------------------------------------------------------
	
	// 6. 학생 - 강의홈 - 온라인 출석부 - 로그인한 학생 정보 조회 (학번, 이름, 휴대전화)
	public Users selectLoginStuInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("lectureMapper.selectLoginStuInfo", userNo);
	}
	
	// 7. 학생 - 강의홈 - 온라인 출석부 - 진행한 강좌 총 개수 조회
	public int selectAttListCount(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.selectOne("lectureMapper.selectAttListCount", l);
	}
	
	// 8. 학생 - 강의홈 - 온라인 출석부 - 선택한 강좌의 진행한 강좌리스트 조회
	public ArrayList<Lecture> selectAttList(SqlSessionTemplate sqlSession, PageInfo pi, Lecture l){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectAttList", l, rowBounds);
	}
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(출석)
	public int SelectAttStaListA(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.selectOne("lectureMapper.SelectAttStaListA", l);
	}
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(결석)
	public int SelectAttStaListB(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.selectOne("lectureMapper.SelectAttStaListB", l);
	}
	
	// 학생 - 강의홈 - 로그인한 학생의 출석상태 조회(지각)
	public int SelectAttStaListC(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.selectOne("lectureMapper.SelectAttStaListC", l);
	}
	
	// 교수 - 마이페이지 - 진행강의 조회 리스트 조회
	public ArrayList<Lecture> selectProfessorClassList(SqlSessionTemplate sqlSession, int userNo){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectProfessorClassList", userNo);
	}
	
	// 교수 - 마이페이지 - 진행강의조회 : 원하는 년도, 학기에 따라 강의 리스트 조회
	public ArrayList<Lecture> SelectProfessorSearchClassList(SqlSessionTemplate sqlSession, Lecture l){
		return (ArrayList)sqlSession.selectList("lectureMapper.SelectProfessorSearchClassList", l);
	}
	
	// 교수 - 강의페이지 - 출결관리 - 진행한 강의 총 개수 조회
	public int selectProAttListCount(SqlSessionTemplate sqlSession, Lecture l) {
		return sqlSession.selectOne("lectureMapper.selectProAttListCount", l);
	}
	
	// 교수 - 강의페이지 - 출결관리 - 진행한 강의 리스트 조회
	public ArrayList<Lecture> selectProAttList(SqlSessionTemplate sqlSession, PageInfo pi, Lecture l){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectProAttList", l, rowBounds);
	}
	
	// 교수 - 강의페이지 - 출결관리 - 출결관리 상세
	public ArrayList<Lecture> selectAttDetail(SqlSessionTemplate sqlSession, Lecture l){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectAttDetail", l);
	}
	
	// 교수 - 출결관리 - 해당 강의를 듣는 학생 목록 조회
	public ArrayList<Lecture> AjaxSelectselectAttStuList(SqlSessionTemplate sqlSession, int classCode){
		return (ArrayList)sqlSession.selectList("lectureMapper.AjaxSelectselectAttStuList", classCode);
	}
	
	// 교수 - 출결관리상세(출결등록창)에서 학생 출결을 등록
	public int insertAtt(SqlSessionTemplate sqlSession, Lecture l, ArrayList<Lecture> studNoList) {
	      
	      int result = 0;
	      for(int i=0; i<studNoList.size(); i++) {
	         
	         l.setStudNo(studNoList.get(i).getStudNo());
	        
	         result += sqlSession.insert("lectureMapper.insertAtt", l);
	         
	      }

	      return result;  
	 }


	// 교수 - 출결관리상세 - 학생들의 출결상태를 INSERT하는 컨트롤러	
	public int insertAttStatus(SqlSessionTemplate sqlSession, Lecture l, ArrayList<Lecture> studInfo) {
	
		int result = 0;
		for(int i=0; i<studInfo.size(); i++) {

			l.setStudNo(studInfo.get(i).getStudNo());
			l.setAttendanceStatus(studInfo.get(i).getAttendanceStatus());
			result += sqlSession.update("lectureMapper.insertAttStatus", l);
		}
		
		return result;
	}
	
	
	// 과제 ----------------------------------------------------------------------------------------------------
	
	
	// 마감된 과제 리스트의 게시글 총 수를 조회
	public int selectHomeworkListCount(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.selectOne("lectureMapper.selectHomeworkListCount", h);
	}
	
	// 마감된 과제 리스트 페이지 조회
	public ArrayList<Lecture> selectHomeworkpList(SqlSessionTemplate sqlSession, PageInfo pi, Homework h){

		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectHomeworkpList", h, rowBounds);
	}
	
	// 학생 - 과제업로드 : 제출가능상태의 총 게시글 리스트 조회
	public ArrayList<Homework> selectPhomeworkList(SqlSessionTemplate sqlSession, Homework h){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectPhomeworkList", h);
	}

	// 교수 - 과제관리 : 마감된 과제 리스트 페이지 조회
	public ArrayList<Homework> selectProHomeworkEndList(SqlSessionTemplate sqlSession, PageInfo pi, Homework h){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectProHomeworkEndList", h, rowBounds);
	}
	
	// 교수 - 과제관리 : 제출가능상태의 총 게시글 리스트 조회
	public ArrayList<Homework> selectProhomeworkList(SqlSessionTemplate sqlSession, Homework h){
		return (ArrayList)sqlSession.selectList("lectureMapper.selectProhomeworkList", h);
	}
	
	// 교수 - 과제관리 : 과제등록
	public int insertHomeworkEnrollForm(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.insert("lectureMapper.insertHomeworkEnrollForm", h);
	}
	
	// 교수 - 과제관리 : 과제등록(첨부파일)
	public int insertAttachPHomework(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("lectureMapper.insertAttachPHomework", at);
	}
	
	// 교수 - 과제관리 : 상세페이지 조회 (상단의 교수가 낸 과제 상세페이지)
	public Homework selectProHomework(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.selectOne("lectureMapper.selectProHomework", h);
	}
	
	// 교수 - 과제관리 : 상세페이지 조회 (상단의 교수가 낸 과제 상세페이지)
	public Homework selectProHomeworkI(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.selectOne("lectureMapper.selectProHomeworkI", h);
	}
	
	// 교수 - 과제관리 : 상세페이지 조회 (상단의 교수가 낸 과제 상세페이지에 필요한 첨부파일)
	public Attachment selectAttachHomework(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.selectOne("lectureMapper.selectAttachHomework", h);
	}
	
	// 교수 - 과제관리 : '과제마감'버튼 클릭을 통해 제출가능한과제 상태를 마감상태로 변경
	public int updatepHomeworkStatus(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.update("lectureMapper.updatepHomeworkStatus", h);
	}
	
	// 교수 - 과제관리 : '수정'버튼을 통해 기존의 교수가 낸 과제를 수정
	public int updateProHomework(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.update("lectureMapper.updateProHomework", h);
	}
	
	// 교수 - 과제관리 : '수정'버튼을 통해 기존의 교수가 낸 과제의 첨부파일을 수정
	public int updateProHwAtt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("lectureMapper.updateProHwAtt", at);
	}
	
	// 교수 - 과제관리 : '수정'버튼을 통해 기존의 교수가 낸 과제의 첨부파일을 수정(기존에 파일 x)
	public int insertNewAtt(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("lectureMapper.insertNewAtt", at);
	}
	
	// 교수 - 과제관리 : 상세페이지의 '삭제'버튼을 통해 게시글 삭제
	public int deleteProHomework(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.update("lectureMapper.deleteProHomework", h);
	}
	
	// 교수 - 과제관리 : 상세페이지의 '삭제'버튼을 통해 게시글에 딸린 첨부파일 삭제
	public int deleteAttachProHomework(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.update("lectureMapper.deleteAttachProHomework", h);
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제 상세페이지 조회
	public Homework selectStuHomeworkP(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.selectOne("lectureMapper.selectStuHomeworkP", h);
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제에서 과제 등록 
	public int insertStuHomeworkEnrollForm(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.insert("lectureMapper.insertStuHomeworkEnrollForm", h);
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제등록 시 첨부파일 등록
	public int insertStuAttachPHomework(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("lectureMapper.insertStuAttachPHomework", at);
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제 제출 후 해당 부분 조회 
	public Homework selectStuHomeworkDetail(SqlSessionTemplate sqlSession, Homework h) {
		return sqlSession.selectOne("lectureMapper.selectStuHomeworkDetail", h);
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제 제출 후 해당 부분 첨부파일 조회
	public Attachment selectStuAttachHomework(SqlSessionTemplate sqlSession, Homework h) {
		
		return sqlSession.selectOne("lectureMapper.selectStuAttachHomework", h);
	}

	public int selectLectureDataListCount(SqlSessionTemplate sqlSession, int classNo) {
		
		return sqlSession.selectOne("lectureMapper.selectLectureDataListCount", classNo);
	}

	public ArrayList<Classboard> selectLectureDataList(SqlSessionTemplate sqlSession , int classNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lectureMapper.selectLectureDataList", classNo , rowBounds);
		
	}

	public int increaseMatCount(SqlSessionTemplate sqlSession, int classboardNo) {
		
		return sqlSession.update("lectureMapper.increaseMatCount", classboardNo);
	}

	public Classboard selectLectureMaterialDetail(SqlSessionTemplate sqlSession, int classboardNo) {
		
		return sqlSession.selectOne("lectureMapper.selectLectureMaterialDetail",classboardNo);
	}

	public Attachment selectAttachMaterial(SqlSessionTemplate sqlSession, int classboardNo) {
		
		return sqlSession.selectOne("lectureMapper.selectAttachMaterial" , classboardNo);
	}
	
}
