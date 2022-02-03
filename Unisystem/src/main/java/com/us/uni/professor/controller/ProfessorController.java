package com.us.uni.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProfessorController {
	
	@RequestMapping("list.pr")
	public String selectProfessorInfo() {
		return "professor/professorMyInfoView";
	}
	
	@RequestMapping("stlist.pr")
	public String selectMyStudentList() {
		return "professor/professorMyStudentListView";
	}
	
	@RequestMapping("app.pr")
	public String createClass() {
		return "professor/professorCreateClassForm";
	}
	
}
