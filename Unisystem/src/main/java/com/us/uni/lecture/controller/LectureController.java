package com.us.uni.lecture.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.us.uni.lecture.model.service.HomeworkService;
import com.us.uni.lecture.model.service.LectureService;
import com.us.uni.lecture.model.vo.Lecture;
import com.us.uni.users.model.vo.Users;

@Controller
public class LectureController {
	
	@Autowired
	private LectureService lService;
	
	@Autowired
	private HomeworkService hService;
	
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
	@RequestMapping(value="studentYearList.me", produces="application/json; charset=UTF-8")
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

		ArrayList<Lecture> prosearchList = lService.SelectProfessorSearchClassList(l);
		return new Gson().toJson(prosearchList);
	}
	
	
	
	
	
	
	
	/* 교수 - 출결관리를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAttControl.stu")
	public String selectLectureAttControl() {
		return "lecture/lectureAttendanceControl";
	}
	
	/* 교수 - 출결관리상세(출결등록창)를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAttDetailControl.stu")
	public String selectLectureAttDetailControl() {
		return "lecture/lectureAttendanceDetailControl";
	}
	
	/* 교수 - 강의홈을 띄워주는 컨트롤러 */
	@RequestMapping("lectureProMain.stu")
	public String selectLectureProMainPage() {
		return "lecture/lectureProMainPage";
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
	
	/* 학생 - 메뉴바에서 과제업로드 클릭 시  마감된 과제 리스트를 띄워주는 컨트롤러 */
	// 메뉴바 클릭 시  => homeworkList.lec  (기본적으로 1번 페이지 요청)
	// 페이징바 클릭 시 => homeworkList.lec?cpage=요청하는페이지
	@RequestMapping("homeworkList.lec")
	public String selectHomeworkList(@RequestParam(value="cpage", defaultValue="1") int currentPage) { 
		// @RequestParam => request.getParameter를 대신함
		// "cpage"라는 키값을 int currentPage라는 변수에 담음 
		
		int listCount = hService.selectHomeworkListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		/*
		ArrayList<HomeworkP> list = hService.selectHomeworkpList(pi);
		*/
		
		return "lecture/lectureHomeworkListView";
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
	
}
