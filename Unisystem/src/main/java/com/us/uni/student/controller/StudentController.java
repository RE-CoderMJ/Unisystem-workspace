package com.us.uni.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {

	@RequestMapping("list.st")
	public String selectStudentInfo() {
		return "student/studentMyInfoView";
	}
	
	@RequestMapping("rsvdReading")
	public String readingRoom() {
		return "facility/facilityReadingRoomView";
	}
	
	@RequestMapping("rsvdStudy")
	public String studyRoom() {
		return "facility/facilityStudyRoomView";
	}

	@RequestMapping("enrollForm.st")
	public String enrollForm() {
		return "student/studentEnrollForm";
	}
}
