package com.us.uni.facility.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Controller;

import com.us.uni.facility.model.vo.Facility;

@Controller
public class FacilityDao {

	public int insertReading(SqlSessionTemplate sqlSession, Facility fa) {
		
		return sqlSession.insert("facilityMapper.insertReading", fa);
		
	}
	
	public ArrayList<Facility> reservedReading(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("facilityMapper.reservedReading");
	
	}
	
	public int cancelReading(SqlSessionTemplate sqlSession, Facility fa) {
		return sqlSession.update("facilityMapper.cancelReading", fa);
	}
	
	public ArrayList<Facility> reservedStudy(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("facilityMapper.reservedStudy");
	}
	
	public ArrayList<Facility> ableTime(SqlSessionTemplate sqlSession, String room){
		return (ArrayList)sqlSession.selectList("facilityMapper.ableTime", room);
	}
	
	
	
	
}
