package com.us.uni.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.dao.MailDao;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

@Service
public class MailServiceImpl implements MailService {

	@Autowired
	private MailDao mDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectInboxListCount(int userNo) {
		int result = mDao.selectInboxListCount(sqlSession, userNo);
		return result;
	}

	@Override
	public ArrayList<MailTo> selectInboxList(int userNo, PageInfo pi) {
		ArrayList<MailTo> list = mDao.selectInboxList(sqlSession, userNo, pi);
		return list;
	}
	
	@Override
	public int selectSentListCount(int userNo) {
		int result = mDao.selectSentListCount(sqlSession, userNo);
		return result;
	}

	@Override
	public ArrayList<MailFrom> selectSentList(int userNo, PageInfo pi) {
		ArrayList<MailFrom> list = mDao.selectSentList(sqlSession, userNo, pi);
		return list;
	}
	
	@Override
	public int selectReadReceiptListCount(int userNo) {
		int result = mDao.selectReadReceiptListCount(sqlSession, userNo);
		
		return result;
	}

	@Override
	public ArrayList<MailTo> selectReadReceiptList(int userNo, PageInfo pi) {
		ArrayList<MailTo> list = mDao.selectReadReceiptList(sqlSession, userNo, pi);
		
		return list;
	}
	
	@Override
	public int selectToMeListCount(int userNo) {
		int result = mDao.selectToMeListCount(sqlSession, userNo);
		return result;
	}

	@Override
	public ArrayList<MailFrom> selectToMeList(int userNo, PageInfo pi) {
		ArrayList<MailFrom> list = mDao.selectToMeList(sqlSession, userNo, pi);
		return list;
	}
	
	@Override
	public int saveDraft(MailFrom mf) {		
		int result = mDao.saveDraft(sqlSession, mf);
		return result;
	}
	
	@Override
	public int saveToMeDraft(MailFrom mf) {
		int result = mDao.saveToMeDraft(sqlSession, mf);
		return result;
	}
	
	@Override
	public int selectDraftListCount(int userNo) {
		int result = mDao.selectDraftListCount(sqlSession, userNo);
		return result;
	}

	@Override
	public ArrayList<MailFrom> selectDraftList(int userNo, PageInfo pi) {
		ArrayList<MailFrom> list = mDao.selectDraftList(sqlSession, userNo, pi);
		return list;
	}
	
	@Override
	public MailFrom selectDraft(int mfNo) {
		MailFrom mf = mDao.selectDraft(sqlSession, mfNo);
		return mf;
	}

	@Override
	public int sendMail(MailFrom mf, String[] userToNoArr, String[] ccNoArr, ArrayList<Attachment> attList) {
		
		// 임시저장 메일일 경우 update, 아닐경우 insert
		Integer mNo = new Integer (mf.getMailNo());
		
		int result = mDao.insertUpdateMailFrom(sqlSession, mf);
		
		int result2 = 0;
		for(String s : userToNoArr) {
			MailTo mt = new MailTo();
			mt.setUserToNo(Integer.parseInt(s.substring(0, s.indexOf("@"))));
			// 임시저장 메일일 경우
			if(mNo != null) {
				mt.setMailFromNo(mf.getMailNo());
			}
			result2 = mDao.insertMailTo(sqlSession, mt);			

		}
		
		int result3 = 1;
		
		//참조 메일주소를 입력했을 경우 참조메일 전송
		if(ccNoArr.length != 0) {
			
			for(String cc : ccNoArr) {
				MailTo mt = new MailTo();
				mt.setUserToNo(Integer.parseInt(cc.substring(0, cc.indexOf("@"))));
				// 임시저장 메일일 경우
				if(mNo != null) {
					mt.setMailFromNo(mf.getMailNo());				
				}
				result3 = mDao.insertCcMailTo(sqlSession, mt);
			}
		}
				
		int result4 = 1;
		// 첨부파일이 있을 경우
		if(!attList.isEmpty()) {
				for(Attachment att : attList) {
					// 임시저장 메일일 경우
					if(mNo != null) {
						att.setRefNo(mf.getMailNo());
					}	
					result4 = mDao.insertAttachment(sqlSession, att);
				}
		}
		
		return result * result2 * result3 * result4;
	}
	
	@Override
	public int sendToMeMail(MailFrom mf, ArrayList<Attachment> attList) {
		
		// 임시저장 메일일 경우 update, 아닐경우 insert
		Integer mNo = new Integer (mf.getMailNo());
		int result = mDao.insertMailToMeFrom(sqlSession, mf);
				
		int result2 = 1;
		// 첨부파일이 있을 경우
		if(!attList.isEmpty()) {
				for(Attachment att : attList) {
					// 임시저장 메일일 경우
					if(mNo != null) {
						att.setRefNo(mf.getMailNo());
					}	
					result2 = mDao.insertAttachment(sqlSession, att);
				}
		}
		
		return result * result2;
	}
	
	@Override
	public int selectAttachMailListCount(int userNo) {
		int result = mDao.selectAttachMailListCount(sqlSession, userNo);
		return result;
	}

	@Override
	public ArrayList<MailTo> selectAttachMailList(int userNo, PageInfo pi) {
		ArrayList<MailTo> list = mDao.selectAttachMailList(sqlSession, pi, userNo);
		return list;
	}

	@Override
	public ArrayList<Attachment> selectAllAttachmentList(int userNo) {
		ArrayList<Attachment> attList = mDao.selectAllAttachmentList(sqlSession, userNo);
		return attList;
	}

	@Override
	public int updateReadDate(int mNo) {
		int result = mDao.updateReadDate(sqlSession, mNo);
		return result;
	}
	
	@Override
	public int changeReadStatus(int status, int mNo) {
		return mDao.changeReadStatus(sqlSession, status, mNo);
	}
	
	@Override
	public MailTo selectMail(int mNo) {
		MailTo mt = mDao.selectMail(sqlSession, mNo);
		return mt;
	}
	
	@Override
	public MailFrom selectMfMail(int mNo) {
		MailFrom mf = mDao.selectMfMail(sqlSession, mNo);
		return mf;
	}
	
	@Override
	public MailFrom selectToMeMail(int mNo) {
		MailFrom mf = mDao.selectToMeMail(sqlSession, mNo);
		return mf;
	}
	
	@Override
	public ArrayList<Attachment> selectAttachmentList(int mNo) {
		ArrayList<Attachment> attList = mDao.selectAttachmentList(sqlSession, mNo);
		return attList;
	}
	
	@Override
	public ArrayList<Attachment> selectMfAttachmentList(int mNo) {
		ArrayList<Attachment> attList = mDao.selectMfAttachmentList(sqlSession, mNo);
		return attList;
	}


	@Override
	public int selectUnreadListCount(int userNo) {
		int result = mDao.selectUnreadListCount(sqlSession, userNo);
		return result;
	}

	@Override
	public ArrayList<MailTo> selectUnreadList(int userNo, PageInfo pi) {
		ArrayList<MailTo> list = mDao.selectUnreadList(sqlSession, userNo, pi);
		return list;
	}
	
	@Override
	public int moveToTrash(int mNo, int tNo) {
		int result = mDao.moveToTrash(sqlSession, mNo, tNo);
		return result;
	}
	@Override
	public int selectTrashListCount(int userNo) {
		int result = mDao.selectTrashListCount(sqlSession, userNo);
		return result;
	}
	
	@Override
	public ArrayList<MailTo> selectTrashList(int userNo, PageInfo pi) {
		ArrayList<MailTo> list = mDao.selectTrashList(sqlSession, userNo, pi);
		return list;
	}

	@Override
	public int deleteMail(int mailNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int recoverMail(int mNo, String type) {
		int result = mDao.recoverMail(sqlSession, mNo, type);
		return result;
	}


	


}
