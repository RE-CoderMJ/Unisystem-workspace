package com.us.uni.certificate.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.certificate.model.vo.Certificate;
import com.us.uni.common.model.vo.PageInfo;

public interface CertificateService {
	
	// 증명서 출력 접수 서비스
	int applyCert(Certificate c);

	// 증명서 출력 접수내역 리스트 조회 서비스
	ArrayList<Certificate> selectCertList(int studNo);

	// 증명서 출력 접수 내역 삭제 서비스
	int deleteCert(int cerNo);
	
	// 결제여부 업데이트 서비스
	int updatePayment(HashMap<String, Object> map);
	
	// 발급된 증명서 리스트 조회 서비스
	int selectPaidCertListCount(int studNo);
	ArrayList<Appointment> selectPaidCertList(int studNo, PageInfo pi);


}
