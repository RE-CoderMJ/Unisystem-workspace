package com.us.uni.academicStatus.model.service;

import java.util.ArrayList;

import com.us.uni.academicStatus.model.vo.AcademicStatus;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.student.model.vo.Student;

public interface AcademicStatusService {

	// 학생 학적변동 페이지 서비스
	String selectStuInfo(int userNo);
	
	// 휴학신청 서비스
	int applyAsOff(AcademicStatus as, ArrayList<Attachment> attList);
	
	// 휴복학신청내역 리스트 조회
	ArrayList<AcademicStatus> selectAsList(int userNo);
	//휴학신청내역 상세조회
	AcademicStatus selectAs(int asNo);
	//휴학신청내역 첨부파일 상세조회
	ArrayList<Attachment> selectAttachmentList(int asNo);
	
	//복학신청 서비스
	int applyAsBack(AcademicStatus as);
	
	// 교수페이지 휴복학 신청내역 리스트 조회
	int selectProfAsListCount(int userNo);
	ArrayList<AcademicStatus> selectProfAsList(int userNo);


}
