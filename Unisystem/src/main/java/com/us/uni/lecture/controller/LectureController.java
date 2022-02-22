package com.us.uni.lecture.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.lecture.model.service.LectureService;
import com.us.uni.lecture.model.vo.Homework;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Controller
public class LectureController {
	
	@Autowired
	private LectureService lService;
	
	
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
		
		// 
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
	public ModelAndView selectHomeworkEndList(@RequestParam(value="cpage", defaultValue="1") int currentPage, @RequestParam(value="classNo") int classNo, ModelAndView mv) { 
		// @RequestParam => request.getParameter를 대신함
		// "cpage"라는 키값을 int currentPage라는 변수에 담음 
		
		int listCount = lService.selectHomeworkListCount(classNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<Lecture> list = lService.selectHomeworkpList(pi, classNo);
		
		mv.addObject("pi", pi).addObject("list", list).setViewName("lecture/lectureHomeworkStuListView");
		
		return mv; 
	}
	
	/* 학생 - 과제업로드 : 마감상태 게시글리스트에서 제출상태, 채점상태, 점수를 조회 */
	@ResponseBody
	@RequestMapping(value="IHomeworkList.lec", produces="application/json; charset=UTF-8")
	public String selectIStuHomeworkInfo(Homework h, @RequestParam(value="tdArr[]") List<String>tdArr ) {
		
		ArrayList<Homework> list = lService.selectIStuHomeworkInfo(h, tdArr);
		
		System.out.println(list);
		return new Gson().toJson(list);		
	}
	
	
	
	

	
	/* 학생 - 과제업로드 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkDetail.stu")
	public String selectLectureHomeworkDetial() {
		return "lecture/lectureHomeworkEnrollForm";
	}
	
	/* 학생 - 과제업로드 수정페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkUpdate.stu")
	public String selectLectureHomeworkUpdate() {
		return "lecture/lectureHomeworkUpdateForm";
	}
	
	/* 학생 - 과제업로드 결과페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkResult.stu")
	public String selectLectureHomeworkResult() {
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
	public String selectLectureMaterial() {
		return "lecture/lectureMaterialListView";
	}
	
	/* 수업자료실 상세보기를 띄워주는 컨트롤러 */
	@RequestMapping("lectureMatDetail.stu")
	public String selectLectureMaterialDetail() {
		return "lecture/lectureMaterialDetailView";
	}
	
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
