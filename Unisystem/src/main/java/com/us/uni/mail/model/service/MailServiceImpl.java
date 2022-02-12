package com.us.uni.mail.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public int selectListCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<MailTo> selectMails(PageInfo pi) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int sendMail(MailFrom mf, MailTo mt) {
		// TODO Auto-generated method stub
		return 0;
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

	@Override
	public int saveDraft(MailFrom mf) {
		
		int result = mDao.saveDraft(sqlSession, mf);
		
		return result;
	}

}
