package com.us.uni.mail.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.mail.model.service.MailService;
import com.us.uni.mail.model.vo.MailFrom;

/**
 * @author Minji Kim
 *
 */
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
	
	/**
	 * 메일 작성폼 컨트롤러
	 * @param mNo 임시저장한 메일을 불러올 시의 키값
	 * @return 작성폼 화면
	 */
	@RequestMapping("webMail.writeForm")
	public String writeMailForm(String mNo, Model m){
		
		if(mNo != null) {
			int mfNo = Integer.parseInt(mNo);
			
			MailFrom mf = mService.selectDraft(mfNo);
			m.addAttribute("mf", mf);
		}			
		return "webMail/writeMailForm";		
	}
	
	/**
	 * 메일 전송 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.send")
	public String sendMail(int userNo, String userToNo, String cc, String title, String content) {
		
		MailFrom mf = new MailFrom();
		mf.setUserNo(userNo);
		mf.setTitle(title);
		mf.setContent(content);
		
		
		
		return "";
	}
	
	
	/**
	 * 작성 중 메일 임시저장 컨트롤러
	 * @param mf
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("webMail.saveDraft")
	public String saveDraft(MailFrom mf, HttpSession session, Model m) {
		
		int result = mService.saveDraft(mf);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 임시저장 되었습니다.");
			m.addAttribute("userNo", mf.getUserNo());
			return "redirect:webMail.drafts";
		}else {
			return "";
		}
	}
	
	/**
	 * 임시보관함 메일 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("webMail.drafts")
	public String selectDrafts(){
		
		return "webMail/drafts";
	}
	
	@ResponseBody
	@RequestMapping(value="webMail.selectDraftList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectDraftList(int currentPage, int userNo){
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectDraftListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<MailFrom> list = mService.selectDraftList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
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
