package com.us.uni.lecture.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
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
	
}
