package com.us.uni.appointment.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.common.model.vo.PageInfo;
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

	public int selectAppListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("appMapper.selectAppListCount", userNo);
	}

	public ArrayList<Appointment> selectAppList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("appMapper.selectAppList", userNo);
	}

	public Appointment selectApp(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.selectOne("appMapper.selectApp", appNo);
	}

	public int editApp(SqlSessionTemplate sqlSession, Appointment a) {
		return sqlSession.update("appMapper.editApp", a);
	}

	public int deleteApp(SqlSessionTemplate sqlSession, int appNo) {
		return sqlSession.update("appMapper.deleteApp", appNo);
	}

}
