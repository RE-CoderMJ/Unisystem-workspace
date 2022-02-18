package com.us.uni.facility.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.us.uni.facility.model.service.FacilityService;
import com.us.uni.facility.model.vo.Facility;

@Controller
public class FacilityController {

	@Autowired
	private FacilityService fService; 
	
	
	@RequestMapping("rsvdReading")
	public String readingRoom() {
		return "facility/facilityReadingRoomView";
	}
	
	/**
	 * 현재 열람실 예약 현황을 조회해오는 ajax
	 */
	@ResponseBody
	@RequestMapping(value="selectReading", produces="application/json; charset=UTF-8")
	public String reservedReading() {
		ArrayList<Facility> rsvd = fService.reservedReading();
		
		return new Gson().toJson(rsvd);
	}
		
	@RequestMapping("rsvdStudy")
	public String studyRoom() {
		return "facility/facilityStudyRoomView";
	}
	
	@RequestMapping("rsvdStudy.ad")
	public String adminStudyRoom() {
		return "facility/adminStudyRoomView";
	}
	
	@RequestMapping("rsvdReading.ad")
	public String adminReadingRoom() {
		return "facility/adminReadingRoomView";
	}
	
	@RequestMapping("insert.rr")
	public String insertReading(Facility fa, HttpSession session) {
		
		int result = fService.insertReading(fa);
		
		if(result < 0) {
			
			session.setAttribute("alertMsg", "열람실 예약 실패했습니다.");
		}
			
			return "redirect:rsvdReading";
	}
	
	@RequestMapping("cancel.rr")
	public String cancelReading(Facility fa, HttpSession session) {
		
		int result = fService.cancelReading(fa);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "퇴실되었습니다. 다음 사람을 위해 자리를 정리해주세요!");
			
		} else{
		
			session.setAttribute("alertMsg", "열람실 예약 실패했습니다.");
		}
		
		return "redirect:rsvdReading";
	}
	
	
	@ResponseBody
	@RequestMapping(value="selectStudy", produces="application/json; charset=UTF-8")
	public String reservedStudy() {
		
		ArrayList<Facility> rsvdList = fService.reservedStudy();
		return new Gson().toJson(rsvdList); 
		
	}
	
	@ResponseBody
	@RequestMapping(value="selectTime", produces="application/json; charset=UTF-8")
	public String ableTime(String room) {
		
		ArrayList<Facility> ableTime = fService.ableTime(room);
		return new Gson().toJson(ableTime);
	}

}
