package com.us.uni.certificate.model.service;

import java.util.ArrayList;

import com.us.uni.certificate.model.vo.Certificate;

public interface CertificateService {
	
	// 증명서 출력 접수 서비스
	int applyCert(Certificate c);

	// 증명서 출력 접수내역 리스트 조회 서비스
	ArrayList<Certificate> selectCertList(int studNo);

	// 증명서 출력 접수 내역 삭제 서비스
	int deleteCert(int cerNo);

	int updatePayment(int cerNo);

}
