package com.us.uni.mail.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.vo.Contact;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

public interface MailService {

	// 받은 메일함 리스트 페이지 서비스
	int selectInboxListCount(int userNo);
	ArrayList<MailTo> selectInboxList(int userNo, PageInfo pi);
	
	// 보낸 메일함 리스트 페이지 서비스
	int selectSentListCount(int userNo);
	ArrayList<MailFrom> selectSentList(int userNo, PageInfo pi);
	
	// 수신확인 리스트 페이지 서비스
	int selectReadReceiptListCount(int userNo);
	ArrayList<MailTo> selectReadReceiptList(int userNo, PageInfo pi);
	
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
	
	// 첨부파일 메일함 리스트 페이지 서비스
	int selectAttachMailListCount(int userNo);
	ArrayList<MailTo> selectAttachMailList(int userNo, PageInfo pi);	
	ArrayList<Attachment> selectAllAttachmentList(int userNo);
	
	// 안읽은 메일함 리스트 페이지 서비스
	int selectUnreadListCount(int userNo);
	ArrayList<MailTo> selectUnreadList(int userNo, PageInfo pi);
	
	// 메일 작성하기 서비스
	int sendMail(MailFrom mf, String[] userToNoArr, String[] ccNoArr, ArrayList<Attachment> attList);
	// 내게쓰기 서비스
	int sendToMeMail(MailFrom mf, ArrayList<Attachment> attList);
	
	// 메일 상세조회용 서비스
	MailTo selectMail(int mNo);
	MailFrom selectMfMail(int mNo);
	MailFrom selectToMeMail(int mNo);
	ArrayList<Attachment> selectAttachmentList(int mNo);
	ArrayList<Attachment> selectMfAttachmentList(int mNo);
	
	// 메일 읽음 처리용 서비스
	int updateReadDate(int mNo);
	
	// 메일 읽음||안읽음 처리용 서비스
	int changeReadStatus(int status, int mNo);
	
	// 메일 삭제용(휴지통) 서비스
	int moveToTrash(int mNo, int tNo);
	// 메일 삭제용(중요메일함) 서비스
	int moveToTrashI(HttpSession session, MailTo mt);
	
	// 휴지통 리스트 서비스
	int selectTrashListCount(int userNo);
	ArrayList<MailTo> selectTrashList(int userNo, PageInfo pi);
	
	// 메일 복구 서비스
	int recoverMail(int mNo, String type);
	
	// 메일 영구삭제 서비스
	int deletePermanently(HttpSession session, MailTo mt);
	
	// 휴지통 비우기 서비스
	int emptyTrash(HttpSession session, int userNo);

	// 중요처리
	int changeImportance(String status, int mNo, int type);
	int changeImportanceT(String status, int mNo, String type);
	
	// 중요 메일함 리스트 페이지 서비스
	int selectImportantListCount(int userNo);
	ArrayList<MailTo> selectImportantList(int userNo, PageInfo pi);
	
	// 주소록 추가
	int addContact(Contact c);
	
	// 주소록 리스트 조회
	int selectContactListCount(int userNo);
	ArrayList<MailTo> selectContactList(int userNo, PageInfo pi);
	
	// 주소록 수정시 조회 컨트롤러
	Contact selectContact(int contactNo);
	// 주소록 수정 컨트롤러
	int editContact(Contact c);
	
	// 주소록 삭제 컨트롤러
	int deleteContact(int contactNo);
}
