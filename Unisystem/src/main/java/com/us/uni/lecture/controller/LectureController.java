package com.us.uni.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {
	
	/* 학생 - 마이페이지에서 내가수강중인강의 페이지를 띄워주는 컨트롤러 */
	@RequestMapping("studentClassList.me")
	public String selectStudentClassList() {
		return "student/studentClassList";
	}
	
	/* 교수 - 마이페이지에서 진행강의조회 페이지를 띄워주는 컨트롤러 */
	@RequestMapping("professorClassList.me")
	public String selectProfessorClassList() {
		return "professor/professorClassList";
	}
	
	/* 학생 - 강의홈을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMain.stu")
	public String selectLectureMainPage() {
		return "lecture/lectureStuMainPage";
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
	
	/* 과제업로드를  리스트를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomework.stu")
	public String selectLectureHomework() {
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
