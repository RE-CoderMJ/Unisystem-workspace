package com.us.uni.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class LectureController {
	
	/* 강의홈을 띄워주는 컨트롤러 */
	@RequestMapping("main.stu")
	public String selectLectureInfo() {
		return "lecture/lectureMainPage";
	}
}
