package com.us.uni.professor.controller;

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
		return new Gson().toJson(depart);
	}
	
	@ResponseBody
	@RequestMapping(value="search.pr", produces="application/json; charset=UTF-8")
	public String searchProfessor(@RequestParam(value="cpage", defaultValue="1") String currentPage, String univ, String depart, String keyword) {

		HashMap map = new HashMap();
		map.put("univ", univ);
		map.put("depart", depart);
		map.put("keyword", keyword);
		
		int listCount = pService.selectSearchCount(map);
		
		PageInfo pi = Pagination.getPageInfo(listCount, Integer.parseInt(currentPage), 10, 10);
		ArrayList<Users> searchList = pService.searchProfessor(map, pi);	
		
		JSONObject jobj = new JSONObject();
		jobj.put("searchList", searchList);
		jobj.put("pi", pi);
		jobj.put("univ", univ);
		jobj.put("depart", depart);
		jobj.put("keyword", keyword);
		
		return new Gson().toJson(jobj);
		
	}
	
	@RequestMapping("delete.pr")
	public String professorDelete(String[] dno, HttpSession session) {
		int result = 0;
		for(int i=0; i<dno.length; i++) {
			result = pService.professorDelete(dno[i]);
		}
		
		
		if(result > 0) {
			session.setAttribute("alertMsg", "삭제되었습니다!");
		}else {
			session.setAttribute("alertMsg", "교수 삭제를 실패했습니다.");
		}
		
		return "redirect:professor.ad";
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
