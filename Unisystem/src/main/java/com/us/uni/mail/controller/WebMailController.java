package com.us.uni.mail.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.mail.model.service.MailService;
import com.us.uni.mail.model.vo.MailFrom;
import com.us.uni.mail.model.vo.MailTo;

/**
 * @author Minji Kim
 *
 */
@Controller
public class WebMailController {
	
	@Autowired
	private MailService mService;

	/**
	 * 받은 메일함 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.inbox")
	public String selectReceivedMails(){
		return "webMail/inbox";
	}
	
	/**
	 * 받은 메일함 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.selectInboxList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectInboxList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectInboxListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailTo> list = mService.selectInboxList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}
	
	/**
	 * 보낸 메일함 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.sent")
	public String sentPage(){
	
		return "webMail/sent";
	}
	
	/**
	 * 보낸 메일함 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.selectSentList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectSentList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectSentListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailFrom> list = mService.selectSentList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}
	
	/**
	 * 수신확인 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.sent.readReceipt")
	public String selectreadReceiptMails(){
		return "webMail/readReceipt";
	}
	
	/**
	 * 수신확인 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.selectReadReceiptList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectReadReceiptList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectReadReceiptListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailTo> list = mService.selectReadReceiptList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}
	
	/**
	 * 내게 쓴 메일함 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.toMe")
	public String toMeMailsPage(){
		return "webMail/toMe";
	}
	
	/**
	 * 내게 쓴 메일함 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.selectToMeList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectToMeList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectToMeListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailFrom> list = mService.selectToMeList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}	
	
	/**
	 * 안읽은 메일함 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.unread")
	public String selectUnreadMails(){
		return "webMail/unread";
	}
	
	/**
	 * 안읽은 메일함 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.selectUnreadList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectUnreadList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectUnreadListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<MailTo> list = mService.selectUnreadList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}
	
	@RequestMapping("webMail.important")
	public String selectImportantMails(){
		return "webMail/important";
	}
	
	/**
	 * 첨부파일 메일함 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.attach")
	public String mailsWithAttachPage(){
		return "webMail/attach";
	}
	
	/**
	 * 첨부파일 메일함 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.selectAttachMailList", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectAttachMailList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectAttachMailListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 9);
		ArrayList<MailTo> list = mService.selectAttachMailList(userNo, pi);
		ArrayList<Attachment> attList = mService.selectAllAttachmentList(userNo);
		
		map.put("pi", pi);
		map.put("list", list);
		map.put("attList", attList);
		
		return map;
		
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
	 * 내게쓰기 작성폼 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.writeToMeForm")
	public String writeMailToMeForm(String mNo, Model m){
		
		return "webMail/writeMailToMeForm";		
	}
	
	/**
	 * 메일 전송 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.send")
	public String sendMail(MailFrom mfInfo, String cc, String mNo, HttpSession session, MultipartFile[] files) {
		
		MailFrom mf = new MailFrom();
		mf.setUserNo(mfInfo.getUserNo());
		mf.setAddress(mfInfo.getUserNo() + "@unisystem.com");
		mf.setUserToNo(mfInfo.getUserToNo());
		mf.setTitle(mfInfo.getTitle());
		mf.setContent(mfInfo.getContent());
		
		if(!mNo.equals("")) {
			mf.setMailNo(Integer.parseInt(mNo));
		}
		
		
		String[] userToNoArr = mfInfo.getUserToNo().split(",");
		
		String[] ccNoArr = {};
		// 참조자가 있을 경우
		if(!cc.equals("")) {
			ccNoArr = cc.split(",");
		}
		
		ArrayList<Attachment> attList = new ArrayList<>();
		
		for(MultipartFile f : files) {
			if(!f.getOriginalFilename().equals("")) {
				Attachment att = new Attachment();
				String changeName = saveFile(f, session);
				
				att.setOriginName(f.getOriginalFilename());
				att.setChangeName(changeName);
				att.setPath("resources/uploadFiles/webMail_upfiles/");
				
				attList.add(att);
			}
		}
		
		int result = 0;
		
		if(mf.getUserNo() == Integer.parseInt(mf.getUserToNo().substring(0, mf.getUserToNo().indexOf("@")))) {
			result =  mService.sendToMeMail(mf, attList);
		}else {
			result = mService.sendMail(mf, userToNoArr, ccNoArr, attList);			
		}
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 메일을 전송하였습니다.");
			return "redirect:webMail.inbox";
		}else {
			return "";			
		}
	}
	
	/**
	 * 내게 쓰기 메일 임시저장 컨트롤러
	 * @param mf
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("webMail.saveToMeDraft")
	public String saveToMeDraft(MailFrom mf, HttpSession session, Model m) {
		
		int result = mService.saveToMeDraft(mf);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 임시저장 되었습니다.");
			m.addAttribute("userNo", mf.getUserNo());
			return "redirect:webMail.drafts";
		}else {
			return "";
		}
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
	 * 임시보관함 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.drafts")
	public String selectDrafts(){
		
		return "webMail/drafts";
	}
	
	/**
	 * Ajax 임시보관함 메일 리스트 조회 컨트롤러
	 * @param currentPage
	 * @param userNo
	 * @return
	 */
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
	
	
	/**
	 * 메일 상세조회 페이지(mail_to)
	 * @param mNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("webMail.detailView")
	public ModelAndView selectMail(int mNo, ModelAndView mv){
		
		int result = mService.updateReadDate(mNo);
		
		if(result > 0) {
			MailTo mt = mService.selectMail(mNo);
			ArrayList<Attachment> attList = mService.selectAttachmentList(mNo);
			mv.addObject("mt", mt)
			  .addObject("attList", attList)
			  .setViewName("webMail/detailView");
		}else {
			
		}
		return mv;
	}
	
	/**
	 * 메일 상세조회 페이지(mail_from)
	 * @param mNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("webMail.detailMfView")
	public ModelAndView selectMfMail(int mNo, ModelAndView mv){
		
		MailFrom mf = mService.selectMfMail(mNo);
		ArrayList<Attachment> attList = mService.selectMfAttachmentList(mNo);
		
		mv.addObject("mf", mf)
		  .addObject("attList", attList)
		  .setViewName("webMail/mfDetailView");
		return mv;
	}
	
	/**
	 * 메일 상세조회 페이지(내게쓴 메일 조회용)
	 * @param mNo
	 * @param mv
	 * @return
	 */
	@RequestMapping("webMail.detailToMeView")
	public ModelAndView selectToMeMail(int mNo, ModelAndView mv){
		
		MailFrom mf = mService.selectToMeMail(mNo);
		ArrayList<Attachment> attList = mService.selectMfAttachmentList(mNo);
		
		mv.addObject("mf", mf)
		  .addObject("attList", attList)
		  .setViewName("webMail/mfDetailView");
		return mv;
	}
	
	@RequestMapping("webMail.spam")
	public String selectSpamMails(){
		return "webMail/spam";
	}
	
	/**
	 * 휴지통 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("webMail.trash")
	public String selectDeletedMails(){
		return "webMail/trash";
	}
	
	@ResponseBody
	@RequestMapping(value="webMail.selectTrashList", produces="application/json; charset=utf-8")
	public Map<String, Object> selectTrashList(int currentPage, int userNo) {
		
		Map<String, Object> map = new HashMap();
		
		int listCount = mService.selectTrashListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 15);
		ArrayList<MailTo> list = mService.selectTrashList(userNo, pi);
		
		map.put("pi", pi);
		map.put("list", list);
		return map;
	}
	
	
	/**
	 * 휴지통으로 이동 컨트롤러
	 * @param mNo
	 */
	@ResponseBody
	@RequestMapping(value="webMail.moveToTrash", produces="application/json; charset=utf-8")
	public int moveToTrash(int mNo, int tNo) {
		int result = mService.moveToTrash(mNo, tNo);
		return result;
	}
	
	/**
	 * 메일 복구 컨트롤러
	 * @param mNo
	 * @param type
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.recover", produces="application/json; charset=utf-8")
	public int recoverMail(int mNo, String type) {
		int result = mService.recoverMail(mNo, type);
		return result;
	}
	
	/**
	 * 영구삭제 컨트롤러
	 * @param mt
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.deletePermanently", produces="application/json; charset=utf-8")
	public int deletePermanently(HttpSession session, MailTo mt) {
		return mService.deletePermanently(session, mt);
	}
	
	/**
	 * 휴지통 비우기 컨트롤러
	 * @param session
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="webMail.emptyTrash", produces="application/json; charset=utf-8")
	public int emptyTrash(HttpSession session, int userNo) {
		return mService.emptyTrash(session, userNo);
	}
	
	/**
	 * 읽음처리||안읽음처리용 컨트롤러
	 * @param status
	 * @param mNo
	 */
	@ResponseBody
	@RequestMapping(value="webMail.changeReadStatus", produces="application/json; charset=UTF-8")
	public int changeReadStatus(int status, int mNo) {
		return mService.changeReadStatus(status, mNo);
	}
	
	@RequestMapping("webMail.contact")
	public String selectContacts(){
		return "webMail/contact";
	}
	
	/**
	 * 서버에 첨부파일을 저장시키는 메소드
	 * @param upfile
	 * @param session
	 * @return
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/webMail_upfiles/");
		
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
}
