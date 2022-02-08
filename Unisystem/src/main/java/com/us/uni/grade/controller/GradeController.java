package com.us.uni.grade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class GradeController {

	@RequestMapping("myStu.grade.all")
	public String selectAllGrades() {
		return "grade/gradeAll";
	}
	
	@RequestMapping("myStu.grade.c.semester")
	public String selectGrade() {
		return "grade/gradeSemester";
	}
}
