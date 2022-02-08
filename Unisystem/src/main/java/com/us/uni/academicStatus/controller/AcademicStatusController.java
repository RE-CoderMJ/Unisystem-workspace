package com.us.uni.academicStatus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AcademicStatusController {
	
	@RequestMapping("myStu.academic.apply")
	public String academicPage() {
		return "academicStatus/academicStatusApply";
	}
	
	@RequestMapping("myStu.academic.detail")
	public String selectStuAcademic() {
		return "academicStatus/stuAcademicDetail";
	}
	
	@RequestMapping("myProf.academic.list")
	public String selectProfAcademicList() {
		return "academicStatus/profAcademicList";
	}
	
	@RequestMapping("myProf.academic.detail")
	public String selectProfAcademic() {
		return "academicStatus/profAcademicDetail";
	}
	
	@RequestMapping("admin.academic.list")
	public String selectAdminAcademicList() {
		return "academicStatus/adminAcademicList";
	}
	
	@RequestMapping("admin.academic.detail")
	public String selectAdminAcademic() {
		return "academicStatus/adminAcademicDetail";
	}
}
