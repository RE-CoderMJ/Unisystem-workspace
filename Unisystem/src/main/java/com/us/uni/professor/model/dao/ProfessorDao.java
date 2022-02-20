package com.us.uni.professor.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.us.uni.common.model.vo.PageInfo;
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
}
