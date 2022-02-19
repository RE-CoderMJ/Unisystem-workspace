package com.us.uni.event.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.board.model.vo.Board;
import com.us.uni.event.model.service.EventService;
import com.us.uni.event.model.vo.Event;


@Controller
public class EventController {
	
	
	@Autowired
	private EventService eService;

	//캘린더
	@RequestMapping("calendar")
	public ModelAndView eventList(ModelAndView mv) {
		
		ArrayList<Event> list = eService.selectList();
		
			mv.addObject("list", list)
			  .setViewName("schedule/calendar");
			
		return mv;
	}
	
	@RequestMapping("schedulePopup")
	public String schedulePopup() {
		
		return "schedule/addCalendar";
		
	}
	
	@ResponseBody
	@RequestMapping(value="insertSchedule",method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public int InsertSchedule(Event ev, HttpSession session, Model model){
		 
		Map<Object,Object> map = new HashMap<Object,Object>();
		//System.out.println(map);
		
		int result = eService.insertSchedule(ev);
		 
		return result;		
	}
	
	
	@ResponseBody
	@RequestMapping(value="getevent",method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public String getevent(int euserNo, ModelAndView mv) {
		
		ArrayList<Event> list = eService.userSelectList(euserNo);
		 
		return new Gson().toJson(list);
	}
	

	@ResponseBody
	@RequestMapping(value="deleteSchedule",method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public int deleteSchedule(int eventNo) {
		
		System.out.println(eventNo);
		
		int result = eService.deleteSchedule(eventNo);
		 
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="updateSchedule",method = RequestMethod.POST, produces="application/json; charset=utf-8")
	public int updateSchedule(Event ev) {
		
		System.out.println(ev);
		
		int result = eService.updateSchedule(ev);
		 
		return result;
	}
	

	@RequestMapping("todoList")
	public String todoList() {
		
		return "schedule/todoList";
		
	}
	
	
}
