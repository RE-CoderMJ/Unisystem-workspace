package com.us.uni.certificate.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.certificate.model.dao.CertificateDao;
import com.us.uni.certificate.model.vo.Certificate;

@Service
public class CertificateServiceImpl implements CertificateService{
	
	@Autowired
	private CertificateDao cDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int applyCert(Certificate c) {
		return cDao.applyCert(sqlSession, c);
	}

	@Override
	public ArrayList<Certificate> selectCertList(int studNo) {
		return cDao.selectCertList(sqlSession, studNo);
	}

	@Override
	public int deleteCert(int cerNo) {
		return cDao.deleteCert(sqlSession, cerNo);
	}
}
