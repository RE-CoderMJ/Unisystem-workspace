package com.us.uni.appointment.model.service;

import java.util.ArrayList;

import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.professor.vo.Professor;
import com.us.uni.student.model.vo.Student;

public interface AppointmentService {
	
	// 교수 상담가능시간 업로드 서비스
	int updateAvailableTime(Professor p);
	
	// 교수 상담페이지 서비스
	Professor selectAvailableTime(int profNo);
	
	// 학생 상담신청 페이지 서비스
	Student selectStuAppInfo(int userNo);
	// 상담신청
	int enrollApp(Appointment a);
	
	//학생 상담신청 내역 리스트 서비스
	int selectAppListCount(int userNo);
	ArrayList<Appointment> selectAppList(int userNo, PageInfo pi);

	//학생 상담신청 내역 상세조회 서비스
	Appointment selectApp(int appNo);
	

}
