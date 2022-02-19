package com.us.uni.todo.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.todo.model.vo.Todo;

@Repository
public class TodoDao {

	public int todoInsert(SqlSessionTemplate sqlSession,Todo a) {
		
		return sqlSession.insert("todoMapper.todoInsert",a);
		
	}

	public ArrayList<Todo> todoSelect(SqlSessionTemplate sqlSession, int tuserNo) {
		
		return (ArrayList)sqlSession.selectList("todoMapper.todoSelect",tuserNo);
	}

	public int todoDelete(SqlSessionTemplate sqlSession, Todo a) {
		
		return sqlSession.update("todoMapper.todoDelete",a);
	}

	public int todoCheck(SqlSessionTemplate sqlSession, Todo a) {
		
		return sqlSession.update("todoMapper.todoCheck",a);
	}

}
