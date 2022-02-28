package com.us.uni.student.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.users.model.vo.Users;

@Repository
public class StudentDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studentMapper.selectListCount");
	}
	
	public ArrayList<Users> selectStudentList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectStudentList", null, rowBounds);
	}
	
	public ArrayList<Users> selectDepartment(SqlSessionTemplate sqlSession, String studUniv){
		return (ArrayList)sqlSession.selectList("studentMapper.selectDepartment", studUniv);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("studentMapper.selectSearchCount", map);
	}
	
	public ArrayList<Users> searchStudent(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi) {
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.searchStudent", map, rowBounds);
	}
	
	public int studentDelete(SqlSessionTemplate sqlSession, String dno) {
		
		int result = 0;
	
		int result1 = sqlSession.delete("studentMapper.studentDelete1", dno);
		int result2 = sqlSession.delete("studentMapper.studentDelete2", dno);
		
		result = result1 * result2;
		
		if(result > 0) {
			return result;
		}
		
		return 0;
	}
	
	public int studentInsert(SqlSessionTemplate sqlSession, Users student) {
		
		int result = 0;
		
		int result1 = sqlSession.insert("studentMapper.studentInsert1", student);
		int result2 = sqlSession.insert("studentMapper.studentInsert2", student);		
		
		System.out.println(result);
		
		result = result1 * result2;
		
		if(result > 0) {
			return result;
		}
		
		return 0;
	}
	
	/**
	 * 내 정보 조회하기
	 */
	public Users StudentInfo(SqlSessionTemplate sqlSession, int studNo){
		return sqlSession.selectOne("studentMapper.StudentInfo", studNo);
	}
	
	/**
	 * 내 정보조회 - 정보 수정
	 */
	public int studentUpdateInfo(SqlSessionTemplate sqlSession, Users student) {
		return sqlSession.update("studentMapper.studentUpdateInfo", student);
	}
	
	/**
	 * 내 정보조회 - 비밀번호 변경
	 */
	public int studentUpdatePwd(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.update("studentMapper.studentUpdatePwd", map);
	}
	
	public int adminUpdateInfo(SqlSessionTemplate sqlSession, Users student) {

		int result = 0;
		
		int result1 = sqlSession.insert("studentMapper.adminUpdateInfo1", student);
		int result2 = sqlSession.insert("studentMapper.adminUpdateInfo2", student);		
		
		result = result1 * result2;
		
		if(result > 0) {
			return result;
		}else {
			return 0;
		}
			
		
		
	}
	
	
}
