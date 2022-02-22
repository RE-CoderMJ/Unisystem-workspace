package com.us.uni.appointment.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.appointment.model.dao.AppointmentDao;
import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.professor.vo.Professor;
import com.us.uni.student.model.vo.Student;

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

	@Override
	public Student selectStuAppInfo(int userNo) {
		return aDao.selectStuAppInfo(sqlSession, userNo);
	}

	@Override
	public int enrollApp(Appointment a) {
		return aDao.enrollApp(sqlSession, a);
	}
}
