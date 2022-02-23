package com.us.uni.appointment.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.appointment.model.dao.AppointmentDao;
import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.common.model.vo.PageInfo;
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

	@Override
	public int selectAppListCount(int userNo) {
		return aDao.selectAppListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Appointment> selectAppList(int userNo, PageInfo pi) {
		return aDao.selectAppList(sqlSession, userNo, pi);
	}

	@Override
	public Appointment selectApp(int appNo) {
		return aDao.selectApp(sqlSession, appNo);
	}

	@Override
	public int editApp(Appointment a) {
		return aDao.editApp(sqlSession, a);
	}

	@Override
	public int deleteApp(int appNo) {
		return aDao.deleteApp(sqlSession, appNo);
	}

	@Override
	public int selectProfAppListCount(int userNo) {
		return aDao.selectProfAppListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Appointment> selectProfAppList(int userNo) {
		return aDao.selectProfAppList(sqlSession, userNo);
	}

	@Override
	public int changeAppStatus(Appointment a) {
		return aDao.changeAppStatus(sqlSession, a);
	}
}
