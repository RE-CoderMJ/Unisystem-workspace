package com.us.uni.mail.model.service;

import java.util.ArrayList;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

public interface MailService {

	// 받은 메일함 리스트 페이지 서비스
	int selectInboxListCount(int userNo);
	ArrayList<MailTo> selectInboxList(int userNo, PageInfo pi);
	
	// 보낸 메일함 리스트 페이지 서비스
	int selectSentListCount(int userNo);
	ArrayList<MailFrom> selectSentList(int userNo, PageInfo pi);
	
	// 내게 쓴 메일함 리스트 페이지 서비스
	int selectToMeListCount(int userNo);
	ArrayList<MailFrom> selectToMeList(int userNo, PageInfo pi);
	
	// 임시보관함 리스트 페이지 서비스
	int selectDraftListCount(int userNo);
	ArrayList<MailFrom> selectDraftList(int userNo, PageInfo pi);
	// 메일 임시저장용 서비스
	int saveDraft(MailFrom mf);
	// 내게 쓰기 메일 임시저장용 서비스
	int saveToMeDraft(MailFrom mf);
	// 임시저장 메일 작성페이지에 불러오기 서비스
	MailFrom selectDraft(int mfNo);
	
	
	// 메일 작성하기 서비스
	int sendMail(MailFrom mf, String[] userToNoArr, String[] ccNoArr, ArrayList<Attachment> attList);
	
	// 메일 상세조회용 서비스
	MailTo selectMail(int mailNo);
	
	// 메일 삭제용(휴지통) 서비스
	int moveToTrash(int mailNo);
	
	// 메일 영구삭제용 서비스
	int deleteMail(int mailNo);
	
		
	// 중요메일
	
	// 전달
	
	// 답장
	
	// 읽음처리
	
	// 첨부파일 리스트 조회용 서비스
	
	
}
