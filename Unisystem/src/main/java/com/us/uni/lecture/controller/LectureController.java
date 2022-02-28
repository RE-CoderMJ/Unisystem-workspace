package com.us.uni.lecture.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.lecture.model.service.LectureService;
import com.us.uni.lecture.model.vo.Classboard;
import com.us.uni.lecture.model.vo.Homework;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Controller
public class LectureController {
	
	@Autowired
	private LectureService lService;
	
	
	// 현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// 파일명 수정 작업 후 서버에 업로드시키기("flower.png" => "2022011810350723152.png"
		String originName = upfile.getOriginalFilename();
		
		// 파일 수정명 "20220118103507" (년월일시분초)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000); // 10000 부터 99999 까지의 랜덤값
		String ext = originName.substring(originName.lastIndexOf(".")); // 확장자 추출
		
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/homework_upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	/* 학생 - 메인페이지 : 내가 수강중인 강의 리스트 조회 */
	@RequestMapping("selectStuClassList.lec")
	public ModelAndView selectStudentClassListMainPage(HttpSession session, ModelAndView mv){
		
		
		int userNo = ((Users)session.getAttribute("loginUser")).getUserNo();
		ArrayList<Lecture> list = lService.selectStudentClassList(userNo);
		
		System.out.println(list);
		mv.addObject("list", list).setViewName("common/portalmain");
		
		return mv;
	}
	
	/* 학생 - 마이페이지에서 내가수강중인강의 페이지를 띄워주는 컨트롤러 */
	@RequestMapping("studentClassList.me")
	public ModelAndView selectStudentClassList(int userNo, ModelAndView mv) {
		
		ArrayList<Lecture> list = lService.selectStudentClassList(userNo);
		mv.addObject("list", list).setViewName("student/studentClassList");
		
		return mv;
	}
	
	/* 학생 - 마이페이지 - 내가수강중인강의 페이지에서 년도별, 학기 별 조회 시 강의목록을 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="studentSearchList.me", produces="application/json; charset=UTF-8")
	public String AjaxSelectStudentSearchClassList(int userNo, String classYear, int classSemester) {
		
		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassYear(classYear);
		l.setClassSemester(classSemester);

		ArrayList<Lecture> searchList = lService.selectStudentSearchClassList(l);
		return new Gson().toJson(searchList);
	}
	
	/* 학생, 교수 - 마이페이지 - 내가수강중인강의 페이지(학생) or 진행강의 조회(교수) 에서 년도값을 가져오는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="YearList.me", produces="application/json; charset=UTF-8")
	public String AjaxSelectYearList() {
		ArrayList<Lecture> list = lService.selectYearList();
		return new Gson().toJson(list);
		
	}
	
	/* 학생 - 강의홈에서 강의정보(강의명, 교수명)을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMain.stu")
	public ModelAndView selectLectureMainPage(int lno, HttpSession session, ModelAndView mv) {
		Lecture l = lService.selectLectureMainPage(lno);
		session.setAttribute("classInfo", l);
		
		mv.addObject("lec", l).setViewName("lecture/lectureStuMainPage");
		return mv;
	}
	
	/* 학생 - 강의홈에서 드롭박스에 수강중인 강의 리스트를 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="studentClassList.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectStudentClassList(int userNo) {
		
		ArrayList<Lecture> list = lService.selectStudentClassList(userNo);
		return new Gson().toJson(list);
	}
	
	/* 학생 - 강의홈에서 로그인한 학생의 출석상태(출석)를 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="selectAttStaListA.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectAttStaListA(int userNo, int classCode) {
		
		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassCode(classCode);
		
		int lec = lService.SelectAttStaListA(l);
		return new Gson().toJson(lec);
	}
	
	/* 학생 - 강의홈에서 로그인한 학생의 출석상태(결석)를 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="selectAttStaListB.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectAttStaListB(int userNo, int classCode) {
		
		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassCode(classCode);
		
		int lec = lService.SelectAttStaListB(l);
		return new Gson().toJson(lec);
	}
	
	/* 학생 - 강의홈에서 로그인한 학생의 출석상태(지각)를 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="selectAttStaListC.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectAttStaListC(int userNo, int classCode) {
		
		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassCode(classCode);
		
		int lec = lService.SelectAttStaListC(l);
		return new Gson().toJson(lec);
	}
	
	// 출석 =============================================================================================
	
	/* 학생 - 온라인출석부에서 학생 정보를 가져오는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="LoginStuInfo.stu", produces="application/json; charset=UTF-8")
	public String AjaxSelectLoginStuInfo(int userNo) {
		
		Users u = lService.selectLoginStuInfo(userNo);
		return new Gson().toJson(u);
	}
	
	/* 학생 - 온라인출석부를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAtt.stu")
	public ModelAndView selectLectureAttList(int userNo, int classCode, int lno, ModelAndView mv) {

		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassCode(classCode);
		
		int currentPage = lno;

		int listCount = lService.selectAttListCount(l); // 진행한 강좌 총 개수
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Lecture> list = lService.selectAttList(pi, l);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("lecture/lectureAttendanceStu");
		
		return mv;
	}
	
	/* 교수 - 마이페이지에서 진행강의조회 페이지를 띄워주는 컨트롤러 */
	@RequestMapping("professorClassList.me")
	public ModelAndView selectProfessorClassList(int userNo, ModelAndView mv) {
		
		ArrayList<Lecture> list = lService.selectProfessorClassList(userNo);
		mv.addObject("list", list).setViewName("professor/professorClassList");
		return mv;
	}
	
	/* 교수 - 마이페이지 - 진행강의 조회 페이지에서 년도별, 학기 별 조회 시 강의목록을 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="professorSearchList.me", produces="application/json; charset=UTF-8")
	public String AjaxSelectProfessorSearchClassList(int userNo, String classYear, int classSemester) {
		
		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassYear(classYear);
		l.setClassSemester(classSemester);

		ArrayList<Lecture> proSearchList = lService.SelectProfessorSearchClassList(l);
		return new Gson().toJson(proSearchList);
	}
	
	/* 교수 - 강의홈에서 강의정보(강의명, 교수명)을 띄워주는 컨트롤러 */
	@RequestMapping("lectureProMain.stu")
	public ModelAndView selectLectureProMainPage(int lno, HttpSession session, ModelAndView mv) {
		Lecture l = lService.selectLectureMainPage(lno);
		session.setAttribute("classInfo", l);
		
		mv.addObject("lec", l).setViewName("lecture/lectureProMainPage");
		return mv;
	}
	
	/* 학생 - 강의홈에서 드롭박스에 수강중인 강의 리스트를 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="ProClassList.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectProClassList(int userNo) {
		
		ArrayList<Lecture> list = lService.selectProfessorClassList(userNo);
		return new Gson().toJson(list);
	}
	
	/* 교수 - 출결관리를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAttControl.stu")
	public ModelAndView selectLectureAttControl(int userNo, int classCode, int cpage, ModelAndView mv) {
				
		Lecture l = new Lecture();
		l.setUserNo(userNo);
		l.setClassCode(classCode);
				
		int currentPage = cpage;
		int listCount = lService.selectProAttListCount(l); // 진행한 강좌 총 개수
	
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Lecture> list = lService.selectProAttList(pi, l);

		mv.addObject("pi", pi).addObject("plist", list).setViewName("lecture/lectureAttendanceProControl");
		
		return mv;
	}
	
	/* 교수 - 출결관리 - 해당 강의를 듣는 학생 목록을 가져오는 컨트롤러*/
	@ResponseBody
	@RequestMapping(value="AttStuList.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectselectAttStuList(int classCode) {
		
		ArrayList<Lecture> list = lService.AjaxSelectselectAttStuList(classCode);
		
		return new Gson().toJson(list);
	}
	
	
	/* 교수 - 출결관리상세(출결등록창)를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAttDetailControl.stu")
	public ModelAndView selectLectureAttDetailControl(int lno, String lDate, ModelAndView mv) {
		
		Lecture l = new Lecture();
		l.setClassCode(lno);
		l.setAttendanceDateB(lDate);
		
		ArrayList<Lecture> list = lService.selectAttDetail(l);
		String Title = list.get(0).getClassTitle();
		
		mv.addObject("list", list).addObject("title", Title).setViewName("lecture/lectureAttendanceProDetailControl");
		return mv;
	}
	
	/* 교수 - 출결관리상세(출결등록창)에서 학생정보를 ajax로 띄워주는 컨트롤러 */
	@ResponseBody
	@RequestMapping(value="selectStuList.lec", produces="application/json; charset=UTF-8")
	public String AjaxSelectStuList(int classCode, String attendanceDateB) {
		
		Lecture l = new Lecture();
		l.setClassCode(classCode);
		l.setAttendanceDateB(attendanceDateB);
		
		ArrayList<Lecture> list = lService.selectAttDetail(l);
		return new Gson().toJson(list);
	}
		
	
		
	/* 교수 - 출결관리 - 강의생성 버튼으로 새로운 학생 강의일을 등록하는 컨트롤러 */
	@RequestMapping("insertAtt.lec")
	public String insertAtt(int userNo, Lecture l, HttpSession session, Model model) {
		
		
		ArrayList<Lecture> studNoList = l.getStudsNo();						
		//l.getStudsNo().get(0).getStudNo();
		
		int result = lService.insertAtt(l, studNoList);
		
		if(result == l.getStudsNo().size()) { // 성공
			session.setAttribute("alertMsg", "새로운 강의일 생성 완료");
			return "redirect:lectureAttControl.stu?userNo=" + userNo +"&classCode=" + l.getClassCode() + "&cPage=1";
		} else { // 실패
			model.addAttribute("errorMsg", "강의 생성 실패");
			return "common/errorPage";
		}
		
	}
	
	/* 교수 - 출결관리 - 학생 출결상태를 등록하는(update)하는 컨트롤러 */
	@RequestMapping("insertAttDetail.lec")
	public String insertAttStatus(Lecture l, HttpSession session) {
		
		// 강의 정보 : l.getClassNo(), l.getClassCode() , ..
		// 학생 정보 : l.getStudsNo().get(0).getStudNo() / .getAttendanceStatus()
			
		ArrayList<Lecture> studInfo = l.getStudsNo();
			
		int result = lService.insertAttStatus(l, studInfo);

		if(result == l.getStudsNo().size()) {
			session.setAttribute("alertMsg", "학생 출결정보 작성 완료");
			return "redirect:lectureAttControl.stu?userNo=" + l.getUserNo() +"&classCode=" + l.getClassCode() + "&cpage=1";
		} else { // 실패
			session.setAttribute("alertMsg", "학생 출결정보 작성 실패");
			return "redirect:lectureAttControl.stu?userNo=" + l.getUserNo() +"&classCode=" + l.getClassCode() + "&cpage=1";

		}
	
	}
	
	// 과제 =============================================================================================
	
	/* 학생 - 마감된 과제 리스트를 띄워주는 컨트롤러 */
	// 메뉴바 클릭 시  => homeworkList.lec  (기본적으로 1번 페이지 요청)
	// 페이징바 클릭 시 => homeworkList.lec?cpage=요청하는페이지
	@RequestMapping("homeworkEndList.lec")
	public ModelAndView selectHomeworkEndList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Homework h, ModelAndView mv, HttpSession session) { 
		// @RequestParam => request.getParameter를 대신함
		// "cpage"라는 키값을 int currentPage라는 변수에 담음 
		

		h.setStudNo(((Users)session.getAttribute("loginUser")).getUserNo());
		
		int listCount = lService.selectHomeworkListCount(h);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Lecture> list = lService.selectHomeworkpList(pi, h);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("lecture/lectureHomeworkStuListView");
		
		return mv; 
	}
	
	// 학생 - 과제업로드 : 제출가능상태의 총 게시글 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectPhomeworkList.lec", produces="application/json; charset=UTF-8")
	public String selectPhomeworkList(HttpSession session) {
		
		Homework h = new Homework();
		
		h.setStudNo(((Users)session.getAttribute("loginUser")).getUserNo());
		h.setClassNo(((Lecture)session.getAttribute("classInfo")).getClassNo());
		
		ArrayList<Homework> list = lService.selectPhomeworkList(h);
		
		return new Gson().toJson(list);
	}	

	/* 교수 - 마감된 과제 리스트를 띄워주는 컨트롤러 */
	@RequestMapping("homeworkProEndList.lec")
	public ModelAndView selectProHomeworkEndList(@RequestParam(value="cpage", defaultValue="1") int currentPage, Homework h, ModelAndView mv, HttpSession session) { 
		// @RequestParam => request.getParameter를 대신함
		// "cpage"라는 키값을 int currentPage라는 변수에 담음 
		
		h.setClassNo((((Lecture)session.getAttribute("classInfo")).getClassNo()));
		h.setStudNo(((Users)session.getAttribute("loginUser")).getUserNo());
		
		int listCount = lService.selectHomeworkListCount(h);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Homework> list = lService.selectProHomeworkEndList(pi, h);

		mv.addObject("pi", pi).addObject("list", list).setViewName("lecture/lectureHomeworkProListView");
		
		return mv; 
	}
	
	
	// 교수 - 과제관리 : 제출가능상태의 총 게시글 리스트 조회
	@ResponseBody
	@RequestMapping(value="selectProPhomeworkList.lec", produces="application/json; charset=UTF-8")
	public String selectProhomeworkList(HttpSession session) {
		
		Homework h = new Homework();
	
		h.setClassNo(((Lecture)session.getAttribute("classInfo")).getClassNo());
		
		ArrayList<Homework> list = lService.selectProhomeworkList(h);
		
		return new Gson().toJson(list);
	}
	
	/* 교수 - 과제관리 : 과제 등록페이지를 띄워주는 컨트롤러 */
	@RequestMapping("proHomeworkEnrollForm.lec")
	public String selectHomeworkEnrollFormPage() {
		return "lecture/lectureHomeworkProEnrollForm";
	}
	
	/* 교수 - 과제관리 : 과제 등록 컨트롤러 */
	@RequestMapping("proHomeworkInsert.lec")
	public String insertHomeworkEnrollForm(Homework h, MultipartFile upfile, HttpSession session, Model model ) {
		
		h.setHomeworkpEndDateTime(h.getHomeworkpEndDateTime().replace("T", " "));
	
		Attachment at = new Attachment();
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			// 원본명, 서버업로드된경로를 Attatchment 에 이어서 담기
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setPath("resources/uploadFiles/homework_upfiles/"+ changeName);
		} 
		
		// 넘어온 첨부파일이 있을 경우 h : 제목, 작성자, 내용이 담겨있음
		// 넘어온 첨부파일이 없을 경우 h => if문이 실행 안됨 => 제목, 작성자, 내용만이 담겨있음
		int result = lService.insertHomeworkEnrollForm(h, at);
		
		if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:homeworkProEndList.lec";
		}else { // 실패 => 에러페이지 포워딩
			session.setAttribute("alertMsg", "과제 등록 실패");
			return "lecture/lectureHomeworkProListView";
		}
	}
	
	/* 교수 - 과제관리 : 제출가능한 과제 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureProHomeworkDetailP.stu")
	public ModelAndView selectLectureProHomeworkDetialP(int hno, HttpSession session, ModelAndView mv) {
		// lno => 상세조회시 필요한 게시글 번호
		Homework h = new Homework();
		h.setClassNo(((Lecture)session.getAttribute("classInfo")).getClassNo());
		h.setHomeworkpNo(hno);
	
		// 상단의 교수가 낸 과제 상세보기 항목을 불러오는 select문
		h = lService.selectProHomework(h);		
		Attachment at = lService.selectAttachHomework(h);	
		mv.addObject("h", h).addObject("at", at).setViewName("lecture/lectureHomeworkProDetailViewP");
		
		return mv;
	}
	
	/* 교수 - 과제관리 : 마감된 과제 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureProHomeworkDetailI.stu")
	public ModelAndView selectLectureProHomeworkDetialI(int hno, HttpSession session, ModelAndView mv) {
		// lno => 상세조회시 필요한 게시글 번호
		Homework h = new Homework();
		h.setClassNo(((Lecture)session.getAttribute("classInfo")).getClassNo());
		h.setHomeworkpNo(hno);
	
		// 상단의 교수가 낸 과제 상세보기 항목을 불러오는 select문
		h = lService.selectProHomeworkI(h);		
		Attachment at = lService.selectAttachHomework(h);	
		mv.addObject("h", h).addObject("at", at).setViewName("lecture/lectureHomeworkProDetailViewI");
		
		return mv;
	}
	
	// 교수 - 과제관리 : '과제마감'버튼 클릭을 통해 제출가능한과제 상태를 마감상태로 변경
	@RequestMapping("updatepHomeworkStatus.lec")
	public String updatepHomeworkStatus(Homework h, HttpSession session, Model model) {
		
		int result = 0;
		
		result = lService.updatepHomeworkStatus(h);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 변경되었습니다.");
			return "redirect:homeworkProEndList.lec" ;
		} else {
			model.addAttribute("errorMsg", "과제 상태 변경 실패");
			return "lecture/lectureHomeworkProListView";
		}
		
	}
	
	// 교수 - 과제관리 : 과제상세페이지에서 '수정'버튼을 통해 수정하기 폼을 띄워주기
	@RequestMapping("updateForm.ho")
	public String updatepHomeworkForm(Homework h, HttpSession session, Model model) {
		
		model.addAttribute("h", lService.selectProHomework(h));
		model.addAttribute("at", lService.selectAttachHomework(h));
		
		return "lecture/lectureHomeworkProUpdateForm";
	}
	
	// 교수 - 과제관리 : 과제상세페이지에서 '수정'버튼을 통해 내용 수정하기
	@RequestMapping("updateProHomework.lec")
	public String updateProHomework(int hno, Homework h, Attachment at, MultipartFile reupfile, HttpSession session, Model model) {
		
		h.setHomeworkpEndDateTime(h.getHomeworkpEndDateTime().replace("T", " "));

		int newAtt = 1;
		
		// 새로 넘어온 첨부파일이 있을 경우 => 기존의 첨부파일 있을 경우 기존 첨부파일 삭제 후 새로운 첨부파일 업로드
		if(!reupfile.getOriginalFilename().equals("")) {
					
			if(at.getOriginName() != null) {// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기  =>

				new File(session.getServletContext().getRealPath(at.getChangeName())).delete();
				
				// 새로넘어온 첨부파일 서버 업로드 시키기 
				String changeName = saveFile(reupfile, session);
				// h에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기 
				at.setRefNo(hno);
				at.setOriginName(reupfile.getOriginalFilename());
				at.setChangeName(changeName);
				at.setPath("resources/uploadFiles/homework_upfiles/"+ changeName);
				
				newAtt = lService.updateProHwAtt(at);
				
			} else { // 기존의 첨부파일이 없을 경우 => 새로 전달된 파일 서버에 업로드	
								
				// 새로넘어온 첨부파일 서버 업로드 시키기 
				String changeName = saveFile(reupfile, session);
				// h에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기 
				at.setRefNo(h.getHomeworkpNo());
				at.setOriginName(reupfile.getOriginalFilename());
				at.setChangeName(changeName);
				at.setPath("resources/uploadFiles/homework_upfiles/"+ changeName);
			
				newAtt = lService.insertNewAtt(at);
			}	
			
		}
		
		int result = lService.updateProHomework(h);
		
		if(result * newAtt> 0) { // 수정 성공
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:lectureProHomeworkDetail.stu?hno=" + h.getHomeworkpNo();
		}else { // 수정 실패 => 에러페이지
			model.addAttribute("errorMsg", "게시글 수정 실패");
			return "lecture/lectureHomeworkProListView";
		}
			
	
	}
	
	// 교수 - 과제관리 : 상세페이지의 '삭제'버튼을 통해 게시글 + 첨부파일 삭제
	@RequestMapping("deleteProHomework.lec")
	public String deleteProHomework(int homeworkpNo, String filePath, HttpSession session, Model model) {
		
		Homework h = new Homework();
		h.setClassNo(((Lecture)session.getAttribute("classInfo")).getClassNo());
		h.setHomeworkpNo(homeworkpNo);
			
		int result = lService.deleteProHomework(h);
		
		if(result > 0) {
			
			// 첨부파일이 있을경우 => 첨부파일 삭제
			if(!filePath.equals("")) {  
				int atresult = lService.deleteAttachProHomework(h);
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			// 과제 리스트 url 재요청
			session.setAttribute("alertMsg", "과제 삭제 성공");
			return "redirect:homeworkProEndList.lec";
		} else {
			model.addAttribute("errorMsg", "과제 삭제 실패");
			return "redirect:homeworkProEndList.lec";
		}
		
	}


	/* 학생 - 과제업로드 : 제출가능한 과제 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureStuHomeworkDetail.stu")
	public ModelAndView selectLectureHomeworkDetial(int hno, HttpSession session, ModelAndView mv) {
		
		// lno => 상세조회시 필요한 게시글 번호
		Homework h = new Homework();
		Homework hh = new Homework();
		h.setClassNo(((Lecture)session.getAttribute("classInfo")).getClassNo());
		h.setHomeworkpNo(hno);
	
		// 상단의 교수가 낸 과제 상세보기 항목을 불러오는 select문
		h = lService.selectStuHomeworkP(h);						// 교수가 낸 과제
		//hh = lService.selectStuHomeworkDetail(h);				// 학생이 제출한 과제
		Attachment at = lService.selectAttachHomework(h);		// 교수 첨부파일
		//Attachment att = lService.selectStuAttachHomework(h);	// 학생 첨부파일
		
		mv.addObject("h", h).addObject("at", at).setViewName("lecture/lectureHomeworkStuEnrollForm");
		
		return mv;
		
	}
	
	/* 학생 - 과제업로드 : 제출가능한 과제에서 과제 등록 */
	@RequestMapping("stuHomeworkInsert.lec")
	public String insertStuHomeworkEnrollForm(Homework h, MultipartFile upfile, HttpSession session, Model model) {
			
		Attachment at = new Attachment();
		
		if(!upfile.getOriginalFilename().equals("")) {
			String changeName = saveFile(upfile, session);
			// 원본명, 서버업로드된경로를 Attatchment 에 이어서 담기
			at.setOriginName(upfile.getOriginalFilename());
			at.setChangeName(changeName);
			at.setPath("resources/uploadFiles/homework_upfiles/"+ changeName);
		} 
		
		// 넘어온 첨부파일이 있을 경우 h : 제목, 작성자, 내용이 담겨있음
		// 넘어온 첨부파일이 없을 경우 h => if문이 실행 안됨 => 제목, 작성자, 내용만이 담겨있음
		int result = lService.insertStuHomeworkEnrollForm(h, at);
		
		if(result > 0) { // 성공 => 게시글 리스트페이지 (list.bo  url재요청)
			session.setAttribute("alertMsg", "과제 등록 완료.");
			return "redirect:lectureStuHomeworkDetail.stu?hno=" + h.getHomeworkpNo();
		}else { // 실패 => 에러페이지 포워딩
			session.setAttribute("alertMsg", "과제 등록 실패");
			return "lecture/lectureHomeworkStuListView";
		}
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제 제출 후 해당 부분 조회 
	@ResponseBody
	@RequestMapping(value="selectStuHomeworkDetail.lec", produces="application/json; charset=UTF-8")
	public String selectStuHomeworkDetail(int homeworkpNo) {
		Homework h = new Homework();
		h.setHomeworkpNo(homeworkpNo);
		
		h = lService.selectStuHomeworkDetail(h);	
		
		return new Gson().toJson(h);
	}
	
	// 학생 - 과제업로드 : 제출가능한 과제 제출 후 해당 부분 첨부파일 조회
	@ResponseBody
	@RequestMapping(value="selectStuAttachHomework.lec", produces="application/json; charset=UTF-8")
	public String selectStuAttachHomework(int homeworkpNo) {
		Homework h = new Homework();
		h.setHomeworkpNo(homeworkpNo);

		h = lService.selectStuHomeworkDetail(h);
		Attachment att = lService.selectStuAttachHomework(h);

		return new Gson().toJson(att);
	}
	
	/* 학생 - 과제업로드 수정페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkUpdate.stu")
	public String selectLectureHomeworkUpdate() {
		return "lecture/lectureHomeworkUpdateForm";
	}
	
	/* 학생 - 과제업로드 결과페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkResult.stu")
	public String selectStuHomeworkDeti() {
		return "lecture/lectureHomeworkResult";
	}
	
	/* 공지사항 리스트를 띄워주는 컨트롤러 */
	@RequestMapping("lectureNotice.stu")
	public String selectLectureNotice() {
		return "lecture/lectureNoticeListView";
	}
	
	/* 공지사항 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureDetailNotice.stu")
	public String selectLectureDetailNotice() {
		return "lecture/lectureNoticeDetailView";
	}
	
	/* 학생 - 강의평가를 띄워주는 컨트롤러 */
	@RequestMapping("lectureEvaluation.stu")
	public String selectLectureEvaluation() {
		return "lecture/lectureEvaluation";
	}
	
	/* 교수 - 강의평가 점수창을 띄워주는 컨트롤러 */
	@RequestMapping("lectureEvaluationResult.stu")
	public String selectLectureEvaluationResult() {
		return "lecture/lectureEvaluationResult";
	}
	
	/* 교수 - 강의평가 서술형 상세보기창을 띄워주는 컨트롤러 */
	@RequestMapping("lectureEvaluationDetailResult.stu")
	public String selectLectureEvaluationDetailResult() {
		return "lecture/lectureEvaluationDetailResult";
	}
	
	/* 강의계획표를 띄워주는 컨트롤러 */
	@RequestMapping("lecturePlan.stu")
	public String selectLecturePlan() {
		return "lecture/lecturePlan";
	}
	
	/* 수업자료실을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMat.stu")
	public ModelAndView selectLectureMaterial(@RequestParam(value="cpage",defaultValue="1")int currentPage, HttpSession session,ModelAndView mv) {
		
		//int classNo = ((Classboard)session.getAttribute("classInfo")).getClassNo();
		int classNo = 1010; //임시 번호 
		
		int listCount = lService.selectLectureDataListCount(classNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 10);
		ArrayList<Classboard> list = lService.selectLectureDataList(classNo, pi);
		
		//System.out.println(pi);
		//System.out.println(list);
		
		mv.addObject("pi", pi)
		  .addObject("list", list)
		  .setViewName("lecture/lectureMaterialListView");
		
		return mv;
	}
	
	/* 수업자료실 상세보기를 띄워주는 컨트롤러 */
	@RequestMapping("lectureMatDetail.stu")
	public ModelAndView selectLectureMaterialDetail(int bno, ModelAndView mv) {
		System.out.println(bno);
		//Attachment at = new Attachment();
		
		int result = lService.increaseMatCount(bno);	
		
		if(result > 0) {
			Classboard b = lService.selectLectureMaterialDetail(bno);
			//System.out.println(b);
			//if(at != null) {
			//	at = lService.selectAttachMaterial(bno);
			//}
		
			mv.addObject("b", b)
			  .setViewName("lecture/lectureMaterialDetailView");

		}else {
			mv.addObject("errorMsg", "상세조회 실패").setViewName("lecture/lectureMaterialListView");
		}
		return mv;
	}
		
	
	/*상세조회 조회 컨트롤러 */
	
	
	
	/* 영상자료실을 띄워주는 컨트롤러 */
	@RequestMapping("lectureVideoMat.stu")
	public String selectLectureVideoMaterial() {
		return "lecture/lectureVideoMaterialListView";
	}
	
	/* 영상자료실 상세보기를 띄워주는 컨트롤러 */
	@RequestMapping("lectureVideoMatDetail.stu")
	public String selectLectureVideoMaterialDetail() {
		return "lecture/lectureVideoMaterialDetailView";
	}
	
	
}
