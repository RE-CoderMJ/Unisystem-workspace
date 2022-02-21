package com.us.uni.appointment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.appointment.model.dao.AppointmentDao;
import com.us.uni.professor.vo.Professor;

@Service
public class AppointmentServiceImpl implements AppointmentService {

	@Autowired
	private AppointmentDao aDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updateAvailableTime(Professor p) {
		return aDao.updateAvailableTime(sqlSession, p);
	}

	@Override
	public Professor selectAvailableTime(int profNo) {
		return aDao.selectAvailableTime(sqlSession, profNo);
	}
}
