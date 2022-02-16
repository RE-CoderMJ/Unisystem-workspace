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

}
