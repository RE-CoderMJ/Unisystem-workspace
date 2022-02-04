package com.us.uni.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebMailController {

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
}
