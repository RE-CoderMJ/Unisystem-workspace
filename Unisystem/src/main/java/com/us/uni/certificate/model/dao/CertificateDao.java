package com.us.uni.certificate.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.certificate.model.vo.Certificate;

@Repository
public class CertificateDao {

	public int applyCert(SqlSessionTemplate sqlSession, Certificate c) {
		return sqlSession.insert("certMapper.applyCert", c);
	}

	public ArrayList<Certificate> selectCertList(SqlSessionTemplate sqlSession, int studNo) {
		return (ArrayList)sqlSession.selectList("certMapper.selectCertList", studNo);
	}

	public int deleteCert(SqlSessionTemplate sqlSession, int cerNo) {
		return sqlSession.update("certMapper.deleteCert", cerNo);
	}

	public int updatePayment(SqlSessionTemplate sqlSession,HashMap<String, Object> map) {
		return sqlSession.update("certMapper.updatePayment", map);
	}

	public int selectPaidCertListCount(SqlSessionTemplate sqlSession, int studNo) {
		return sqlSession.selectOne("certMapper.selectPaidCertListCount", studNo);
	}

	public ArrayList<Appointment> selectPaidCertList(SqlSessionTemplate sqlSession, int studNo) {
		return (ArrayList)sqlSession.selectList("certMapper.selectPaidCertList", studNo);
	}

	public Certificate selectCert(SqlSessionTemplate sqlSession, int cerNo) {
		return sqlSession.selectOne("certMapper.selectCert", cerNo);
	}
	
}
