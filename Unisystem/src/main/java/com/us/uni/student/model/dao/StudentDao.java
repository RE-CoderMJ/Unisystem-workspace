package com.us.uni.student.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.student.model.vo.Student;

@Repository
public class StudentDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("studentMapper.selectListCount");
	}
	
	public ArrayList<Student> selectStudentList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.selectStudentList", null, rowBounds);
	}
	
	public ArrayList<Student> selectDepartment(SqlSessionTemplate sqlSession, String studUniv){
		return (ArrayList)sqlSession.selectList("studentMapper.selectDepartment", studUniv);
	}
	
	public int selectSearchCount(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.selectOne("studentMapper.selectSearchCount", map);
	}
	
	public ArrayList<Student> searchStudent(SqlSessionTemplate sqlSession, HashMap map, PageInfo pi) {
		int offset = ((pi.getCurrentPage()-1) * pi.getBoardLimit());
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("studentMapper.searchStudent", map, rowBounds);
	}
	
	
}
