package com.us.uni.appointment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.professor.vo.Professor;
import com.us.uni.student.model.vo.Student;

@Repository
public class AppointmentDao {

	public int updateAvailableTime(SqlSessionTemplate sqlSession, Professor p) {
		
		return sqlSession.update("appMapper.updateAvailableTime", p);
	}

	public Professor selectAvailableTime(SqlSessionTemplate sqlSession, int profNo) {

		return sqlSession.selectOne("appMapper.selectAvailableTime", profNo);
	}

	public Student selectStuAppInfo(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("appMapper.selectStuAppInfo", userNo);
	}

	public int enrollApp(SqlSessionTemplate sqlSession, Appointment a) {
		return sqlSession.insert("appMapper.enrollApp", a);
	}

}
