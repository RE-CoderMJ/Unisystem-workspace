package com.us.uni.certificate.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

	public int updatePayment(SqlSessionTemplate sqlSession, int cerNo) {
		return sqlSession.update("cerMapper.updatePayment", cerNo);
	}
	
}
