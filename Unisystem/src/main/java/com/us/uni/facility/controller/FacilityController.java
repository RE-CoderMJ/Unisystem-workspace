package com.us.uni.facility.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FacilityController {
	
	@RequestMapping("rsvdReading")
	public String readingRoom() {
		return "facility/facilityReadingRoomView";
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

}
