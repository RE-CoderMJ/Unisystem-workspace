package com.us.uni.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {
	
	/* 학생 - 강의홈을 띄워주는 컨트롤러 */
	@RequestMapping("lectureMain.stu")
	public String selectLectureInfo() {
		return "lecture/lectureStuMainPage";
	}
	
	/* 학생 - 공지사항 리스트를 띄워주는 컨트롤러 */
	@RequestMapping("lectureNotice.stu")
	public String selectLectureNoticeInfo() {
		return "lecture/lectureStuNoticeListView";
	}
	
}
