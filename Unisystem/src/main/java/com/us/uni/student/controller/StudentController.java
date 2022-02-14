package com.us.uni.student.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.student.model.service.StudentServiceImpl;
import com.us.uni.users.model.vo.Users;

@Controller
public class StudentController {

	@Autowired
	private StudentServiceImpl sService;
	
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
		ArrayList<Users> list = sService.selectStudentList(pi);
			
		mv.addObject("pi", pi).addObject("list", list).setViewName("student/adminStudentListView");
		
		return mv; 
	}

	
	@ResponseBody
	@RequestMapping(value="department", produces="application/json; charset=UTF-8")
	public String selectDepartment(String studUniv) {
		ArrayList<Users> depart = sService.selectDepartment(studUniv);
		return new Gson().toJson(depart);
		
	}
	
	@ResponseBody
	@RequestMapping(value="search.st", produces="application/json; charset=UTF-8")
	public String searchStudent(@RequestParam(value="cpage", defaultValue="1") String currentPage, String univ, String depart, String keyword) {

		HashMap map = new HashMap();
		map.put("univ", univ);
		map.put("depart", depart);
		map.put("keyword", keyword);
		
		int listCount = sService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, Integer.parseInt(currentPage), 10, 10);
		ArrayList<Users> searchList = sService.searchStudent(map, pi);	
		
		JSONObject jobj = new JSONObject();
		jobj.put("searchList", searchList);
		jobj.put("pi", pi);
		jobj.put("univ", univ);
		jobj.put("depart", depart);
		jobj.put("keyword", keyword);
		
		return new Gson().toJson(jobj);
		
	}
	
	@RequestMapping("delete.st")
	public String studentDelete(String[] dno, HttpSession session) {
		
		int result = 0;
		for(int i=0; i<dno.length; i++) {
			result = sService.studentDelete(dno[i]);
		}
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제되었습니다!");
			return "redirect:student.ad";
		}else {
			session.setAttribute("alertMsg", "학생 삭제를 실패했습니다.");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("insert.st")
	public void studentInsert(Users student) {
	
		int result = 0;
		result = sService.studentInsert(student);		
		
		System.out.println(result);
		
	}
	
}
