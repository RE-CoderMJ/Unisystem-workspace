package com.us.uni.event.model.service;

import java.util.ArrayList;

import com.us.uni.event.model.vo.Event;

public interface EventService {

	int insertSchedule(Event ev);

	ArrayList<Event> selectList();

	ArrayList<Event> userSelectList(int euserNo);

}
