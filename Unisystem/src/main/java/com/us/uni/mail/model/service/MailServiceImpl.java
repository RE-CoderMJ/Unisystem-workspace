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
	public int saveDraft(MailFrom mf) {		
		int result = mDao.saveDraft(sqlSession, mf);
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
		if(ccNoArr.length > 1) {
			
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
	public MailTo selectMail(int mailNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int moveToTrash(int mailNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMail(int mailNo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
