package com.us.uni.facility.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.facility.model.dao.FacilityDao;
import com.us.uni.facility.model.vo.Facility;

@Service
public class FacilityServiceImpl implements FacilityService {

	@Autowired
	private FacilityDao fDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession; 
	
	@Override
	public int insertReading(Facility fa) {
		
		return fDao.insertReading(sqlSession, fa);
	}

	@Override
	public ArrayList<Facility> reservedReading() {
		return fDao.reservedReading(sqlSession);
		
	}

	@Override
	public int cancelReading(Facility fa) {
		return fDao.cancelReading(sqlSession, fa);
	}

	@Override
	public ArrayList<Facility> reservedStudy() {
		return fDao.reservedStudy(sqlSession);
	}

	@Override
	public ArrayList<Facility> ableTime(String room) {
		return fDao.ableTime(sqlSession, room);
	}

	@Override
	public int insertStudy(Facility fa) {
		return fDao.insertStudy(sqlSession, fa);
	}

	@Override
	public int cancelStudy(int rsvdNo) {
		return fDao.cancelStudy(sqlSession, rsvdNo);
	}


	
	
}
