package com.us.uni.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {

	@RequestMapping("list.st")
	public String selectStudentInfo() {
		return "student/studentMyInfoView";
	}
	
	@RequestMapping("enrollForm.st")
	public String enrollForm() {
		return "student/studentEnrollForm";
	}
	
	@RequestMapping("student.ad")
	public String selectStudentList() {
		return "student/adminStudentListView";
	}
}
