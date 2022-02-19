package com.us.uni.facility.model.service;

import java.util.ArrayList;

import com.us.uni.facility.model.vo.Facility;

public interface FacilityService {
	
	// 1. 열람실
	int insertReading(Facility fa);
	ArrayList<Facility> reservedReading();
	int cancelReading(Facility fa);

	// 2. 스터디룸 예약
	int insertStudy();
	ArrayList<Facility> reservedStudy();
	// 스터디룸별 예약 가능한 시간 조회
	ArrayList<Facility> ableTime(String room);
	int insertStudy(Facility fa);
}
