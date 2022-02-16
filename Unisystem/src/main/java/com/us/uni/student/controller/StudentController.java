package com.us.uni.student.controller;

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
import com.us.uni.student.model.service.StudentService;
import com.us.uni.users.model.vo.Users;

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
	public String studentInsert(Users student, MultipartFile upfile, HttpSession session) {
		
		int result = 0;
		
		result = sService.studentInsert(student);		
	
		// 학생 정보 등록 시 프로필 사진 파일을 Student에 경로 저장
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			
			student.setProfileImg("/resources/images/uploadFiles/profile/" + changeName);
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "학생 등록이 되었습니다!");
			return "redirect:student.ad";
		}else {
			session.setAttribute("alertMsg", "학생 등록 실패했습니다.");
			return "common/errorPage";
		}
		
	}
	
	
	// * 첨부파일 : 파일명 수정 작업 후 서버에 업로드
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		String originName = upfile.getOriginalFilename(); // "flower.png"
		
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // 20220118103507 (년월일시분초)
		int ranNum = (int)(Math.random() * 90000 + 10000); // 99999까지의 5자리 랜덤값
		String ext = originName.substring(originName.lastIndexOf("."));
								// "."의 인덱스 값 => 처음부터 .전까지 추출됨
		
		String changeName = currentTime + ranNum + ext;

		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기 (session 필요함)
		String savePath = session.getServletContext().getRealPath("/resources/images/uploadFiles/profile/"); 
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
