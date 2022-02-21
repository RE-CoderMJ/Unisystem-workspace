package com.us.uni.appointment.model.service;

import com.us.uni.professor.vo.Professor;

public interface AppointmentService {
	
	// 교수 상담가능시간 업로드 서비스
	int updateAvailableTime(Professor p);
	
	// 교수 상담페이지 서비스
	Professor selectAvailableTime(int profNo);

}
