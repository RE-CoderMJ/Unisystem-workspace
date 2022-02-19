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
		
		int result = fDao.insertReading(sqlSession, fa);
		
		return result;
	}

	@Override
	public int insertStudy() {
		
		return 0;
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

	
}
