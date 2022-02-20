package com.us.uni.professor.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.professor.model.service.ProfessorService;
import com.us.uni.users.model.vo.Users;

@Controller
public class ProfessorController {
	
	@Autowired
	private ProfessorService pService;
	
	/**
	 * admin : 교수 목록 조회 페이지
	 */
	@RequestMapping("professor.ad")
	public ModelAndView selectProfessorList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Users> list = pService.selectProfessorList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("professor/adminProfessorListView");
		
		return mv; 
	}
	
	
	@ResponseBody
	@RequestMapping(value="department.pr", produces="application/json; charset=UTF-8")
	public String selectDepartment(String profUniv) {
		ArrayList<Users> depart = pService.selectDepartment(profUniv);
		System.out.println(depart);
		return new Gson().toJson(depart);
	}
	
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
	
	
	
	@RequestMapping("clist.ad")
	public String requestClassList() {
		return "professor/adminRequestClassListView";
	}
}
