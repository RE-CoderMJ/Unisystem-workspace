package com.us.uni.todo.model.service;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.todo.model.dao.TodoDao;
import com.us.uni.todo.model.vo.Todo;

@Service
public class TodoServiceImpl implements TodoService{

	@Autowired 
	private TodoDao tDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Override
	public int todoInsert(Todo a) {
		
		return tDao.todoInsert(sqlSession,a);
	}


	@Override
	public ArrayList<Todo> todoSelect(int tuserNo) {
		
		return tDao.todoSelect(sqlSession,tuserNo);
	}


	@Override
	public int todoDelete(Todo a) {
		
		return tDao.todoDelete(sqlSession,a);
	}


	@Override
	public int todoCheck(Todo a) {
		
		return tDao.todoCheck(sqlSession,a);
	}

}
