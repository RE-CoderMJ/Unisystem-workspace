package com.us.uni.appointment.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.us.uni.appointment.model.service.AppointmentService;
import com.us.uni.professor.vo.Professor;
import com.us.uni.users.model.vo.Users;

@Controller
public class AppointmentController {
	
	@Autowired
	private AppointmentService aService;
	
	@RequestMapping("myStu.appList")
	public String selectAppList() {
		return "appointment/studentAppointmentList";
	}
	
	@RequestMapping("myStu.appDetail")
	public String selectApp() {
		return "appointment/studentAppointmentDetail";
	}
	
	@RequestMapping("myStu.appEnrollForm")
	public String enrollForm() {
		return "appointment/studentAppointmentEnrollForm";
	}
	
	@RequestMapping("myProf.appDetail")
	public String selectProfApp() {
		return "appointment/profAppointmentDetail";
	}
	
	@RequestMapping("myProf.appList")
	public String selectProfAppList(Model m, HttpSession session) {
		
		Users u = (Users)session.getAttribute("loginUser");
		
		Professor p = aService.selectAvailableTime(u.getProfNo());
		
		if(p !=null) {
			String time = p.getProfAppTime();
			String day = p.getProfAppDay();			
			m.addAttribute("time", time);
			m.addAttribute("day", day);
		}
		
		
		return "appointment/profAppointmentList";
	}
	
	/**
	 * 교수 상담가능시간 업로드 
	 * @return
	 */
	@RequestMapping("myProf.updateAvailableTime")
	public String updateAvailableTime(Professor p) {
		
		int result = aService.updateAvailableTime(p);
		
		if(result > 0) {
			return "redirect:myProf.appList";
		}else {
			return "";
		}
	}
}
