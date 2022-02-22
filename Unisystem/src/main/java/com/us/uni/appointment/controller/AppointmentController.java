package com.us.uni.appointment.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.us.uni.appointment.model.service.AppointmentService;
import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.professor.vo.Professor;
import com.us.uni.student.model.vo.Student;
import com.us.uni.users.model.vo.Users;

@Controller
public class AppointmentController {
	
	@Autowired
	private AppointmentService aService;
	
	@RequestMapping("myStu.appList")
	public String appList() {
		return "appointment/studentAppointmentList";
	}
	
	@ResponseBody
	@RequestMapping("myStu.selectAppList")
	public Map<String, Object> selectAppList(int currentPage, int userNo){
		
		Map<String, Object> map = new HashMap();
		
		int listCount = aService.selectAppListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Appointment> list = aService.selectAppList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		System.out.println(list);
		
		return map;
	}
	
	
	@RequestMapping("myStu.appDetail")
	public String selectApp() {
		return "appointment/studentAppointmentDetail";
	}
	
	/**
	 * 상담 신청 작성 폼 컨트롤러
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("myStu.appEnrollForm")
	public String enrollForm(HttpSession session, Model m) {
		
		Users u = (Users)session.getAttribute("loginUser");
		
		Student s = aService.selectStuAppInfo(u.getUserNo());
		m.addAttribute("s", s);
		
		return "appointment/studentAppointmentEnrollForm";
	}
	
	/**
	 * 상담 신청 컨트롤러
	 * @param a
	 * @return
	 */
	@RequestMapping("myStu.enrollApp")
	public String enrollApp(Appointment a) {
		a.setAppDate(a.getAppDate() + a.getAppTime());
		
		int result = aService.enrollApp(a);
		
		if(result > 0) {
			return "redirect:myStu.appList";			
		}else {
			return "";
		}
	}
	
	@RequestMapping("myProf.appDetail")
	public String selectProfApp() {
		return "appointment/profAppointmentDetail";
	}
	
	/**
	 * 교수 상담신청 내역 리스트 컨트롤러
	 * @param m
	 * @param session
	 * @return
	 */
	@RequestMapping("myProf.appList")
	public String selectProfAppList(Model m, HttpSession session) {
		
		Users u = (Users)session.getAttribute("loginUser");
		
		Professor p = aService.selectAvailableTime(u.getProfNo());
		
		if(p !=null) {	
			m.addAttribute("time", p.getProfAppTime());
			m.addAttribute("day",  p.getProfAppDay());
			m.addAttribute("profNo", p.getProfNo());
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
