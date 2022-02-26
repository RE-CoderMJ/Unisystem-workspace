package com.us.uni.certificate.model.service;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.certificate.model.dao.CertificateDao;
import com.us.uni.certificate.model.vo.Certificate;
import com.us.uni.common.model.vo.PageInfo;

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

	@Override
	public int updatePayment(HashMap<String, Object> map) {
		return cDao.updatePayment(sqlSession, map);
	}

	@Override
	public int selectPaidCertListCount(int studNo) {
		return cDao.selectPaidCertListCount(sqlSession, studNo);
	}

	@Override
	public ArrayList<Appointment> selectPaidCertList(int studNo, PageInfo pi) {
		return cDao.selectPaidCertList(sqlSession, studNo);
	}

	@Override
	public Certificate selectCert(int cerNo) {
		return cDao.selectCert(sqlSession, cerNo);
	}

	
}
