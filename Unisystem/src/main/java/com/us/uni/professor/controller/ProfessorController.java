package com.us.uni.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author Dayn
 *
 */
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
	
	@RequestMapping("enrollForm.pr")
	public String professorEnrollForm() {
		return "professor/professorEnrollForm";
	}
	
	
	/**
	 * admin : 학생의 담당교수 조회/변경 페이지
	 */
	@RequestMapping("join.ad")
	public String selectJoinList() {
		return "professor/adminJoinListView";
	}
	
	
	
}
