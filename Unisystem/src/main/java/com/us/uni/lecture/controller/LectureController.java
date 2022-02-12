package com.us.uni.lecture.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.lecture.model.service.HomeworkService;
import com.us.uni.lecture.model.vo.HomeworkP;
import com.us.uni.lecture.model.vo.Lecture;

@Controller
public class LectureController {
	
	@Autowired
	private HomeworkService hService;
	
	/* 학생 - 마이페이지에서 내가수강중인강의 페이지를 띄워주는 컨트롤러 */
	@RequestMapping("studentClassList.me")
	public ModelAndView selectStudentClassList(int userNo, ModelAndView mv) {
		
		ArrayList<Lecture> list = hService.selectStudentClassList(userNo);

		mv.addObject("list", list).setViewName("student/studentClassList");
		
		return mv;
	}
	
	/* 학생 - 마이페이지 - 내가수강중인강의 페이지에서 년도별, 학기 별 조회 시 강의목록을 띄워주는 컨트롤러 */
	/*
	@RequestMapping("studentDateClassList.me")
	public void selectStudentDateClassList(int year, int semester) {
		
		System.out.println(year);
		System.out.println(semester);
		ArrayList<Lecture> list = hService.selectStudentDateClassList(year, semester);

	}
	*/
	
	/* 학생 - 마이페이지 - 내가수강중인강의 페이지에서 년도값을 가져오는 컨트롤러 */
	@RequestMapping
	public ModelAndView selectYearList(ModelAndView mv) {
		
		ArrayList<Lecture> list = hService.selectYearList();
		System.out.println(list);
		mv.addObject("yearList", list).setViewName("student/studentClassList");
		return mv;
		
	}
	
	/* 학생 - 강의홈에서 강의정보(강의명, 교수명)을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMain.stu")
	public String selectLectureMainPage() {
		return "lecture/lectureStuMainPage";
	}
	
	
	/* 교수 - 마이페이지에서 진행강의조회 페이지를 띄워주는 컨트롤러 */
	@RequestMapping("professorClassList.me")
	public String selectProfessorClassList() {
		return "professor/professorClassList";
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
	
	/* 학생 - 온라인출석부를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAtt.stu")
	public String selectLectureAtt() {
		return "lecture/lectureAttendance";
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
