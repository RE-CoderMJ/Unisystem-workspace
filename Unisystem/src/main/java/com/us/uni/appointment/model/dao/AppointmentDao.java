package com.us.uni.appointment.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.professor.vo.Professor;

@Repository
public class AppointmentDao {

	public int updateAvailableTime(SqlSessionTemplate sqlSession, Professor p) {
		
		return sqlSession.update("appMapper.updateAvailableTime", p);
	}

	public Professor selectAvailableTime(SqlSessionTemplate sqlSession, int profNo) {

		return sqlSession.selectOne("appMapper.selectAvailableTime", profNo);
	}

}
