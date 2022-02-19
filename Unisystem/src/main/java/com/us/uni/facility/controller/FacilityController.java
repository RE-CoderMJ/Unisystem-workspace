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
	/**
	 * @param room
	 * @return
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
	
	
	/**
	 * 스터디룸 예약 현황 시간표에 보여지는 당일 예약된 데이터를 조회하기 위함
	 */
	@ResponseBody
	@RequestMapping(value="selectStudy", produces="application/json; charset=UTF-8")
	public String reservedStudy() {
		
		ArrayList<Facility> rsvdList = fService.reservedStudy();
		return new Gson().toJson(rsvdList); 
		
	}
	
	/**
	 * 사용 공간에 따라 바뀌는 사용 가능 시간을 조회하기 위함
	 */
	@ResponseBody
	@RequestMapping(value="selectTime", produces="application/json; charset=UTF-8")
	public String ableTime(String room) {
		
		ArrayList<Facility> ableTime = fService.ableTime(room);
		return new Gson().toJson(ableTime);
	}
	
	@RequestMapping("insert.sr")
	public String insertStudy(Facility fa, HttpSession session) {
		
		int result = fService.insertStudy(fa);
		
		if(result < 0) {
			
			session.setAttribute("alertMsg", "열람실 예약 실패했습니다.");
		}
			
			return "redirect:rsvdStudy";
	}
	
	@RequestMapping("cancel.sr")
	public String cancelStudy(int rsvdNo, HttpSession session) {
	
		int result = fService.cancelStudy(rsvdNo);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "예약 취소되었습니다.");
			
		} else{
		
			session.setAttribute("alertMsg", "예약 취소를 실패했습니다.");
		}
		
		return "redirect:rsvdStudy";
	}

}
