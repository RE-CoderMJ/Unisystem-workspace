package com.us.uni.mail.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

public interface MailService {

	// 메일 리스트 페이지 서비스
	int selectListCount();
	ArrayList<MailTo> selectMails(PageInfo pi);
	
	// 메일 작성하기 서비스
	int sendMail(MailFrom mf, MailTo mt);
	
	// 메일 상세조회용 서비스
	MailTo selectMail(int mailNo);
	
	// 메일 삭제용(휴지통) 서비스
	int moveToTrash(int mailNo);
	
	// 메일 영구삭제용 서비스
	int deleteMail(int mailNo);
	
	// 메일 임시저장용 서비스
	int saveDraft(MailFrom mf);
	
	// 중요메일
	
	// 전달
	
	// 답장
	
	// 읽음처리
	
	// 
	
	
}
