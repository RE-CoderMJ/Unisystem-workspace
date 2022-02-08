package com.us.uni.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {
	
	/* 강의홈을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMain.stu")
	public String selectLectureMainPage() {
		return "lecture/lectureStuMainPage";
	}
	
	/* 공지사항 리스트를 띄워주는 컨트롤러 */
	@RequestMapping("lectureNotice.stu")
	public String selectLectureNotice() {
		return "lecture/lectureStuNoticeListView";
	}
	
	/* 공지사항 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureDetailNotice.stu")
	public String selectLectureDetailNotice() {
		return "lecture/lectureStuNoticeDetailView";
	}
	
	/* 강의평가를 띄워주는 컨트롤러 */
	@RequestMapping("lectureEvaluation.stu")
	public String selectLectureEvaluation() {
		return "lecture/lectureStuEvaluation";
	}
	
	/* 강의계획표를 띄워주는 컨트롤러 */
	@RequestMapping("lecturePlan.stu")
	public String selectLecturePlan() {
		return "lecture/lectureStuPlan";
	}
	
	/* 온라인출석부를 띄워주는 컨트롤러 */
	@RequestMapping("lectureAtt.stu")
	public String selectLectureAtt() {
		return "lecture/lectureAttendance";
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
	
	/* 과제업로드 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkDetail.stu")
	public String selectLectureHomeworkDetial() {
		return "lecture/lectureHomeworkEnrollForm";
	}
	
	/* 과제업로드 수정페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureHomeworkUpdate.stu")
	public String selectLectureHomeworkUpdate() {
		return "lecture/lectureHomeworkUpdateForm";
	}
	
}
