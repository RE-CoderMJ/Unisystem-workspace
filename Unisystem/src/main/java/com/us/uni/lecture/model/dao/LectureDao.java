package com.us.uni.lecture.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Repository;

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
}
