package com.us.uni.event.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.event.model.vo.Event;
import com.us.uni.todo.model.vo.Todo;

@Repository
public class EventDao {

	public int insertSchedule(SqlSessionTemplate sqlSession, Event ev) {
		
		return sqlSession.insert("eventMapper.insertSchedule",ev);
	}

	public ArrayList<Event> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("eventMapper.selectList");
	}

	public ArrayList<Event> userSelectList(SqlSessionTemplate sqlSession,int euserNo) {
		
		return (ArrayList)sqlSession.selectList("eventMapper.userSelectList", euserNo);
	}

	public int deleteSchedule(SqlSessionTemplate sqlSession, int eventNo) {
		
		return sqlSession.delete("eventMapper.deleteSchedule", eventNo);
	}

	public int updateSchedule(SqlSessionTemplate sqlSession, Event ev) {
		
	return sqlSession.update("eventMapper.updateSchedule",ev);
	}

	public ArrayList<Todo> getTodoCal(SqlSessionTemplate sqlSession, int tuserNo) {
		
		return (ArrayList)sqlSession.selectList("todoMapper.todoSelect",tuserNo);
	}
}

