package com.us.uni.appointment.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AppointmentController {
	
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
	public String selectProfAppList() {
		return "appointment/profAppointmentList";
	}
}
