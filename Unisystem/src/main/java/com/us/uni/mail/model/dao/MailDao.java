package com.us.uni.mail.model.dao;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.mail.model.vo.Contact;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

@Repository
public class MailDao {

	public int selectInboxListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectInboxListCount", userNo);
	}

	public ArrayList<MailTo> selectInboxList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectInboxList", userNo, rowBounds);
	}
	
	public int saveDraft(SqlSessionTemplate sqlSession, MailFrom mf) {
		return sqlSession.insert("mailMapper.saveDraft", mf);
	}
	
	public int saveToMeDraft(SqlSessionTemplate sqlSession, MailFrom mf) {
		return sqlSession.insert("mailMapper.saveToMeDraft", mf);
	}

	public int selectDraftListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectDraftListCount", userNo);
	}

	public ArrayList<MailFrom> selectDraftList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectDraftList", userNo, rowBounds);
	}

	public MailFrom selectDraft(SqlSessionTemplate sqlSession, int mfNo) {
		return sqlSession.selectOne("mailMapper.selectDraft", mfNo);
	}

	public int insertUpdateMailFrom(SqlSessionTemplate sqlSession, MailFrom mf) {

		if(mf.getMailNo() == 0) {
			return sqlSession.insert("mailMapper.insertMailFrom", mf);
		}else {
			return sqlSession.update("mailMapper.updateMailFrom", mf);			
		}
		
	}
	
	public int insertMailToMeFrom(SqlSessionTemplate sqlSession, MailFrom mf) {
		if(mf.getMailNo() == 0) {
			return sqlSession.insert("mailMapper.insertMailToMeFrom", mf);			
		}else {
			return sqlSession.insert("mailMapper.updateMailFrom", mf);
		}
	}

	public int insertMailTo(SqlSessionTemplate sqlSession, MailTo mt) {
				
		if(mt.getMailFromNo() == 0) {
			return sqlSession.insert("mailMapper.insertMailTo", mt);			
		}else {
			return sqlSession.insert("mailMapper.insertDraftMailTo", mt);			
		}
	}
	
	public int insertCcMailTo(SqlSessionTemplate sqlSession, MailTo mt) {
		
		if(mt.getMailFromNo() == 0) {
			return sqlSession.insert("mailMapper.insertCcMailTo", mt);			
		}else {
			return sqlSession.insert("mailMapper.insertDraftCcMailTo", mt);
		}
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment att) {
		
		if(att.getRefNo() == 0) {
			return sqlSession.insert("mailMapper.insertAttachment",att);			
		}else {
			return sqlSession.insert("mailMapper.insertDraftAttachment", att);			
		}
	}

	public int selectSentListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectSentListCount", userNo);
	}

	public ArrayList<MailFrom> selectSentList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectSentList", userNo, rowBounds);
	}

	public int selectToMeListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectToMeListCount", userNo);
	}

	public ArrayList<MailFrom> selectToMeList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectToMeList", userNo, rowBounds);
	}

	public int selectAttachMailListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectAttachMailListCount", userNo);
	}

	public ArrayList<MailTo> selectAttachMailList(SqlSessionTemplate sqlSession, PageInfo pi, int userNo) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectAttachMailList", userNo, rowBounds);
	}

	public ArrayList<Attachment> selectAllAttachmentList(SqlSessionTemplate sqlSession, int userNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectAllAttachmentList", userNo);
	}

	public int updateReadDate(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.update("mailMapper.updateReadDate", mNo);
	}

	public MailTo selectMail(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("mailMapper.selectMail", mNo);
	}
	
	public MailFrom selectMfMail(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("mailMapper.selectMfMail", mNo);
	}
	
	public MailFrom selectToMeMail(SqlSessionTemplate sqlSession, int mNo) {
		return sqlSession.selectOne("mailMapper.selectToMeMail", mNo);
	}


	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int mNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectAttachmentList", mNo);
	}
	
	public ArrayList<Attachment> selectMfAttachmentList(SqlSessionTemplate sqlSession, int mNo) {
		return (ArrayList)sqlSession.selectList("mailMapper.selectMfAttachmentList", mNo);
	}


	public int selectUnreadListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectUnreadListCount", userNo);
	}

	public ArrayList<MailTo> selectUnreadList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectUnreadList", userNo, rowBounds);
	}

	public int selectReadReceiptListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectReadReceiptListCount", userNo);
	}

	public ArrayList<MailTo> selectReadReceiptList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectReadReceiptList", userNo, rowBounds);
	}

	public int changeReadStatus(SqlSessionTemplate sqlSession, int status, int mNo) {

		if(status == 0) {
			return sqlSession.update("mailMapper.updateReadDate", mNo);
		}else {
			return sqlSession.update("mailMapper.changeReadStatus", mNo);
		}
		
	}

	public int moveToTrash(SqlSessionTemplate sqlSession, int mNo, int tNo) {
		if(tNo == 1) {
			return sqlSession.update("mailMapper.moveToTrashF", mNo);
		}else {
			return sqlSession.update("mailMapper.moveToTrash", mNo);			
		}
	}
	
	public int moveToTrashI(SqlSessionTemplate sqlSession, HttpSession session, MailTo mt) {
		
		int mNo = mt.getMailNo();
		
		if(mt.getType().equals("f")) {
			return sqlSession.update("mailMapper.moveToTrashF", mNo);
		}else {
			return sqlSession.delete("mailMapper.moveToTrash", mNo);
		}
	}

	public int selectTrashListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectTrashListCount", userNo);
	}

	public ArrayList<MailTo> selectTrashList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectTrashList", userNo, rowBounds);
	}

	public int recoverMail(SqlSessionTemplate sqlSession, int mNo, String type) {
		
		if(type.equals("f")) {
			return sqlSession.update("mailMapper.recoverMailF", mNo);
		}else {
			return sqlSession.update("mailMapper.recoverMailT", mNo);
		}
		
	}

	public int deletePermanently(SqlSessionTemplate sqlSession, HttpSession session, MailTo mt) {
		
		if(mt.getType().equals("f")) {
			
			// 임시저장 메일이거나 내게 쓴 메일일 경우
			if(mt.getSaveStatus().equals("Y") || mt.getToMe().equals("Y")) {

				int result = 1;
				
				// 내게 쓴 메일의 경우 첨부파일이 있을 때
				if(mt.getFileName() != null) {
					int mNo = mt.getMailNo();
					ArrayList<Attachment> attList = (ArrayList)sqlSession.selectList("mailMapper.selectMfAttachmentList", mNo);
					
					// 서버에서 파일 삭제
					for(Attachment att : attList) {
						String filePath = att.getPath() + att.getChangeName();
						new File(session.getServletContext().getRealPath(filePath)).delete();
					}
					
					// db에서 첨부파일 정보 삭제
					result = sqlSession.delete("mailMapper.deleteAttachment", mt);
				}
				
				//db에서 메일 정보 삭제
				int result2 = sqlSession.delete("mailMapper.deletePermanentlyD", mt);
				
				return result * result2;
			}else {
				return sqlSession.update("mailMapper.deletePermanentlyF", mt);				
			}
		}else {
			return sqlSession.delete("mailMapper.deletePermanentlyT", mt);
		}
	}

	public int emptyTrash(SqlSessionTemplate sqlSession, HttpSession session, int userNo) {

		ArrayList<MailTo> list = (ArrayList)sqlSession.selectList("mailMapper.selectTrashList", userNo);
		System.out.println(list);
		int result = 0;
		for(MailTo mt : list) {
			mt.setMailNo(mt.getMailFromNo());
			result = deletePermanently(sqlSession, session, mt);
		}
		
		return result;
	}

	public int changeImportance(SqlSessionTemplate sqlSession, int mNo, String status, int type) {
		MailTo mt = new MailTo();
		mt.setMailNo(mNo);
		mt.setStatus(status);
		
		if(type == 1) {
			return sqlSession.update("mailMapper.changeImportance", mt);			
		}else {
			return sqlSession.update("mailMapper.changeImportanceF", mt);
		}
	}

	public int changeImportanceT(SqlSessionTemplate sqlSession, int mNo, String status, String type) {
		MailTo mt = new MailTo();
		mt.setMailNo(mNo);
		mt.setStatus(status);
		
		if(type.equals("t")) {
			return sqlSession.update("mailMapper.changeImportance", mt);			
		}else {
			return sqlSession.update("mailMapper.changeImportanceF", mt);
		}
	}

	public int selectImportantListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectImportantListCount", userNo);
	}

	public ArrayList<MailTo> selectImportantList(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectImportantList", userNo, rowBounds);
	}

	public int addContact(SqlSessionTemplate sqlSession, Contact c) {
		return sqlSession.insert("mailMapper.addContact", c);
	}

	public int selectContactListCount(SqlSessionTemplate sqlSession, int userNo) {
		return sqlSession.selectOne("mailMapper.selectContactListCount", userNo);
	}

	public ArrayList<MailTo> selectContactListCount(SqlSessionTemplate sqlSession, int userNo, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("mailMapper.selectContactList", userNo, rowBounds);
	}

	public Contact selectContact(SqlSessionTemplate sqlSession, int contactNo) {
		return sqlSession.selectOne("mailMapper.selectContact",contactNo);
	}

	public int editContact(SqlSessionTemplate sqlSession, Contact c) {
		return sqlSession.update("mailMapper.editContact", c);
	}

	public int deleteContact(SqlSessionTemplate sqlSession, int contactNo) {
		return sqlSession.delete("mailMapper.deleteContact", contactNo);
	}
	
}
