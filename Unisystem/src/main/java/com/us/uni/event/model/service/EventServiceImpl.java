package com.us.uni.event.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.event.model.dao.EventDao;
import com.us.uni.event.model.vo.Event;
import com.us.uni.todo.model.vo.Todo;

@Service
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int insertSchedule(Event ev) {
		
		return eDao.insertSchedule(sqlSession, ev);
	}

	@Override
	public ArrayList<Event> selectList() {
		
		return eDao.selectList(sqlSession);
	}

	@Override
	public ArrayList<Event> userSelectList(int euserNo) {
		
		return eDao.userSelectList(sqlSession,euserNo);
	}

	@Override
	public int deleteSchedule(int eventNo) {
		
		return eDao.deleteSchedule(sqlSession,eventNo);
	}

	@Override
	public int updateSchedule(Event ev) {
		
		return eDao.updateSchedule(sqlSession,ev);
	}

	@Override
	public ArrayList<Todo> getTodoCal(int tuserNo) {
		
		return eDao.getTodoCal(sqlSession,tuserNo);
	}

}
