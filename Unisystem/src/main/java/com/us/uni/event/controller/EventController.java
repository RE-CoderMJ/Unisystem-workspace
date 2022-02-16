package com.us.uni.event.controller;

import org.springframework.web.bind.annotation.RequestMapping;

public class EventController {
	
	

	//캘린더
	@RequestMapping("calendar")
	public String eventList() {
		
		return "schedule/calendar";
		
	}
}
