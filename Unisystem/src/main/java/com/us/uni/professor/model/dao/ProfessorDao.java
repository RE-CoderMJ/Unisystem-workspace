package com.us.uni.professor.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Controller
public class ProfessorDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("professorMapper.selectListCount");
	}
		
	public ArrayList<Users> selectProfessorList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("professorMapper.selectProfessorList", null, rowBounds);
	}
	
	public ArrayList<Users> selectDepartment(SqlSessionTemplate sqlSession, String profUniv) {
		return (ArrayList)sqlSession.selectList("professorMapper.selectDepartment", profUniv);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("professorMapper.selectSearchCount", map);
	}
	
	public ArrayList<Users> searchProfessor(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi) {
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("professorMapper.searchProfessor", map, rowBounds);
	}
	
	public int professorDelete(SqlSessionTemplate sqlSession, String dno) {
		int result = 0;
		int result1 = sqlSession.delete("professorMapper.professorDelete1", dno);
		int result2 = sqlSession.delete("professorMapper.professorDelete2", dno);
		
		result = result1 * result2;
		if(result > 0) {
			return result;
		}
		return 0;
	}
	
	public int classInsert(SqlSessionTemplate sqlSession, Lecture lec) {
		return sqlSession.insert("lectureMapper.classInsert", lec);
	}
	
	public int selectAppCount(SqlSessionTemplate sqlSession, int profNo) {
		return sqlSession.selectOne("lectureMapper.selectAppCount", profNo);
	}
	
	public ArrayList<Lecture> classAppList(SqlSessionTemplate sqlSession, int profNo, PageInfo pi) {
		
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("lectureMapper.classAppList", profNo, rowBounds);
	}
	
	public int changeProfessorJoin(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("professorMapper.changeProfessorJoin", map);
	}
	
	public int professorInsert(SqlSessionTemplate sqlSession, Users professor) {
		int result = 0;
		int result1 = sqlSession.insert("professorMapper.professorInsert1", professor);
		int result2 = sqlSession.insert("professorMapper.professorInsert2", professor);
		
		result = result1 * result2;
		if(result > 0) {
			return result;
		}
		return 0;
	}
	public int selectMyStudentCount(SqlSessionTemplate sqlSession, int profNo) {
		return sqlSession.selectOne("professorMapper.selectMyStudentCount", profNo);
	}
	
	public ArrayList<Users> selectMyStudent(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi){
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("professorMapper.selectMyStudent", map, rowBounds);
	}
	
	public int requestClassCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("professorMapper.requestClassCount");
	}
	
	public ArrayList<Lecture> requestClassList (SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("professorMapper.requestClassList", null, rowBounds);
	}
}
