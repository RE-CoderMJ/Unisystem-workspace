package com.us.uni.student.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StudentController {

	@RequestMapping("list.st")
	public String selectStudentList() {
		return "student/studentListView";
	}
	
}
