package com.us.uni.professor.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.lecture.model.vo.Lecture;
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
	
	/**
	 * 교수 리스트에서 교수 삭제
	 */
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
	
	
	/**
	 * 교수: 학부 목록 조회
	 */
	@ResponseBody
	@RequestMapping(value="department.pr", produces="application/json; charset=UTF-8")
	public String selectDepartment(String profUniv) {
		ArrayList<Users> depart = pService.selectDepartment(profUniv);
		return new Gson().toJson(depart);
	}
	
	/**
	 * 대학별, 학부별, 키워드별 검색 기능
	 */
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
	
	/**
	 * 교수 페이지에서 각 교수의 강의 개설 신청 내역 조회
	 */
	@RequestMapping("app.pr")
	public ModelAndView classAppList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv, HttpSession session) {
		
		int profNo = (((Users)session.getAttribute("loginUser")).getUserNo());
		int listCount = pService.selectAppCount(profNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 8);
		ArrayList<Lecture> list = pService.classAppList(profNo, pi);
		
		mv.addObject("list", list).addObject("pi", pi).setViewName("professor/professorCreateClassForm");
	
		return mv;
	}
	
	/**
	 * 교수 : 강의 개설
	 */
	@RequestMapping("insertClass.pr")
	public String classInsert(Lecture lec, MultipartFile upfile, HttpSession session) {
		
		int result = 0;
		
			
			if(!upfile.getOriginalFilename().equals("")) {
				String changeName = saveFile(upfile, session);
				
				lec.setClassPlan("resources/uploadFiles/classPlan/" + changeName);
			}
			
		result = pService.classInsert(lec);
		
		if(result > 0) {
			
			session.setAttribute("alertMsg", "강의 개설 신청이 완료되었습니다.");
		}else {
			session.setAttribute("alertMsg", "강의 개설 신청 실패했습니다.");
		}
		
		return "redirect:app.pr";
	}
				
	/**
	 * admin : 학생의 담당교수 조회/변경 페이지
	 */
	@RequestMapping("join.ad")
	public ModelAndView selectJoinList(@RequestParam(value="cpage", defaultValue="1") int currentPage, ModelAndView mv) {
		
		int listCount = pService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Users> list = pService.selectProfessorList(pi);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("professor/adminJoinListView");
		
		return mv;
	}
		
	
	/**
	 * 각 학생의 담당 교수 변경
	 */
	@RequestMapping("changeJoin")
	public String changeProfessorJoin(int profNo, int[] studNo, HttpSession session) {
		int result = 0;
		
		for(int i=0; i<studNo.length; i++) {
			HashMap map = new HashMap();
			map.put("profNo", profNo);
			map.put("studNo", studNo[i]);
			
			result = pService.changeProfessorJoin(map);
		}
		

		if(result > 0) {
			session.setAttribute("alertMsg", "담당 교수가 변경되었습니다!");
		}else {
			session.setAttribute("alertMsg", "담당 교수 변경을 실패했습니다.");
		}
		
		return "redirect:join.ad";
			
		
	}
			
			
			
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping("list.pr")
	public String selectProfessorInfo() {
		return "professor/professorMyInfoView";
	}
	
	@RequestMapping("stlist.pr")
	public String selectMyStudentList() {
		return "professor/professorMyStudentListView";
	}
	
	
	
	@RequestMapping("enrollForm.pr")
	public String professorEnrollForm() {
		return "professor/professorEnrollForm";
	}
	

	
	
	@RequestMapping("clist.ad")
	public String requestClassList() {
		return "professor/adminRequestClassListView";
	}
	
	
	
	// * 강의 개설 시 첨부하는 강의계획서 첨부파일 : 파일명 수정 작업 후 서버에 업로드
		public String saveFile(MultipartFile upfile, HttpSession session) {
			
			String originName = upfile.getOriginalFilename();
			
			String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 20220118103507 (년월일시분초)
			int ranNum = (int)(Math.random() * 90000 + 10000); // 99999까지의 5자리 랜덤값
			String ext = originName.substring(originName.lastIndexOf("."));
									// "."의 인덱스 값 => 처음부터 .전까지 추출됨
			
			String changeName = currentTime + ranNum + ext;

			// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기 (session 필요함)
			String savePath = session.getServletContext().getRealPath("resources/uploadFiles/classPlan/"); 
			// getRealPath : 실제 저장시킬 파일의 물리적인 경로, 해당 경로 안에 changeName이라는 이름으로 해당 파일을 업로드 시킬 예정!
			
			try {
				upfile.transferTo(new File(savePath + changeName));
				// 설정한 경로에 바뀐이름으로 새로 생성
				
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			return changeName;
			
			
		}
}
