package com.us.uni.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {
	
	/* 학생 - 강의홈을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMain.stu")
	public String selectLectureMainPage() {
		return "lecture/lectureStuMainPage";
	}
	
	/* 학생 - 공지사항 리스트를 띄워주는 컨트롤러 */
	@RequestMapping("lectureNotice.stu")
	public String selectLectureNotice() {
		return "lecture/lectureStuNoticeListView";
	}
	
	/* 학생 - 공지사항 상세페이지를 띄워주는 컨트롤러 */
	@RequestMapping("lectureDetailNotice.stu")
	public String selectLectureDetailNotice() {
		return "lecture/lectureStuNoticeDetailView";
	}
	
}
