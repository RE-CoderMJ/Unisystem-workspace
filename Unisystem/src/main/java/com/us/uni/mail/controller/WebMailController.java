package com.us.uni.mail.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.us.uni.mail.model.service.MailService;
import com.us.uni.mail.model.vo.MailFrom;

@Controller
public class WebMailController {
	
	@Autowired
	private MailService mService;

	@RequestMapping("webMail.inbox")
	public String selectReceivedMails(){
		return "webMail/inbox";
	}
	
	@RequestMapping("webMail.sent")
	public String selectSentMails(){
		return "webMail/sent";
	}
	
	@RequestMapping("webMail.sent.readReceipt")
	public String selectreadReceiptMails(){
		return "webMail/readReceipt";
	}
	
	@RequestMapping("webMail.toMe")
	public String selectToMeMails(){
		return "webMail/toMe";
	}
	
	@RequestMapping("webMail.drafts")
	public String selectDraftsMails(){
		return "webMail/drafts";
	}
	
	@RequestMapping("webMail.spam")
	public String selectSpamMails(){
		return "webMail/spam";
	}
	
	@RequestMapping("webMail.trash")
	public String selectDeletedMails(){
		return "webMail/trash";
	}
	
	@RequestMapping("webMail.unread")
	public String selectUnreadMails(){
		return "webMail/unread";
	}
	
	@RequestMapping("webMail.important")
	public String selectImportantMails(){
		return "webMail/important";
	}
	
	@RequestMapping("webMail.attach")
	public String selectMailsWithAttach(){
		return "webMail/attach";
	}
	
	@RequestMapping("webMail.writeForm")
	public String writeMailForm(){
		return "webMail/writeMailForm";
	}
	
	@RequestMapping("webMail.send")
	public String sendMail() {
		
		return "";
	}
	
	@RequestMapping("webMail.saveDraft")
	public String saveDraft(MailFrom mf, HttpSession session, Model m) {
		
		int result = mService.saveDraft(mf);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 임시저장 되었습니다.");
			return "redirect:webMail.drafts";
		}else {
			return "";
		}
	}
	
	@RequestMapping("webMail.detailView")
	public String selectMail(){
		return "webMail/detailView";
	}
	
	@RequestMapping("webMail.contact")
	public String selectContacts(){
		return "webMail/contact";
	}
}
