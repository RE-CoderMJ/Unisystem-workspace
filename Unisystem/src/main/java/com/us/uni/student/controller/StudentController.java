package com.us.uni.student.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.student.model.service.StudentService;
import com.us.uni.student.model.vo.Student;

@Controller
public class StudentController {

	@Autowired
	private StudentService sService;
	
	@RequestMapping("list.st")
	public String selectStudentInfo() {
		return "student/studentMyInfoView";
	}
	
	@RequestMapping("enrollForm.st")
	public String enrollForm() {
		return "student/studentEnrollForm";
	}
	
	@RequestMapping("student.ad")
	public ModelAndView selectStudentList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = sService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Student> list = sService.selectStudentList(pi);
			
		mv.addObject("pi", pi).addObject("list", list).setViewName("student/adminStudentListView");
		
		return mv; 
	}
	
	@RequestMapping("department")
	public String selectDepartment(String studUniv, Model model) {
		ArrayList<Student> depart = sService.selectDepartment(studUniv);
		model.addAttribute(depart);
		System.out.println(depart);
		return "student/adminStudentListView";
		
		
	}
	
		
	
}
