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
		
		int result1 = sqlSession.insert("studentmapper.studentInsert1", student);
		int result2 = sqlSession.insert("studentmapper.studentInsert2", student);		
		
		result = result1 * result2;
		
		if(result > 0) {
			return result;
		}
		
		return 0;
	}
	
	
}
