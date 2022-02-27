package com.us.uni.academicStatus.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.us.uni.academicStatus.model.service.AcademicStatusService;
import com.us.uni.academicStatus.model.vo.AcademicStatus;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.users.model.vo.Users;

@Controller
public class AcademicStatusController {
	
	@Autowired
	private AcademicStatusService acService;
	
	/**
	 * 학적변동 페이지 컨트롤러
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("myStu.academic.apply")
	public String academicPage(HttpSession session, Model m) {
		
		Users u = (Users)session.getAttribute("loginUser");
		
		String profName = acService.selectStuInfo(u.getUserNo());
		ArrayList<AcademicStatus> asList = acService.selectAsList(u.getUserNo());
		//AcademicStatus as = acService.selectAs(u.getUserNo());
		
		m.addAttribute("profName", profName);
		m.addAttribute("asList", asList);
		
		return "academicStatus/academicStatusApply";
	}
	
	/**
	 * 휴학신청 컨트롤러
	 * @param as
	 * @param session
	 * @param files
	 * @return
	 */
	@RequestMapping("myStu.academic.applyAsOff")
	public String applyAsOff(AcademicStatus as, HttpSession session, MultipartFile[] files) {
		
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
		System.out.println(as);
		int result = acService.applyAsOff(as, attList);
		
		if(result > 0) {
			return "redirect:myStu.academic.apply";			
		}else {
			return "";
		}
	}
	
	/**
	 * 복학신청 컨트롤러
	 * @param as
	 * @param session
	 * @return
	 */
	@RequestMapping("myStu.academic.applyAsBack")
	public String applyAsBack(AcademicStatus as, HttpSession session) {
		
		ArrayList<Attachment> attList = new ArrayList<>();
		
		int result = acService.applyAsBack(as);
		
		if(result > 0) {
			return "redirect:myStu.academic.apply";			
		}else {
			return "";
		}
	}
	
	@RequestMapping("myStu.academic.detail")
	public String selectStuAcademic() {
		return "academicStatus/stuAcademicDetail";
	}
	
	@RequestMapping("myProf.academic.list")
	public String selectProfAcademicList(HttpSession session, Model m) {
		Users u = (Users)session.getAttribute("loginUser");
		
		int listCount = acService.selectProfAsListCount(u.getUserNo());
		
		ArrayList<AcademicStatus> asList = acService.selectProfAsList(u.getUserNo());
		m.addAttribute("asList", asList);
		return "academicStatus/profAcademicList";
	}
	
	@RequestMapping("admin.academic.list")
	public String selectAdminAcademicList() {
		return "academicStatus/adminAcademicList";
	}
	
	/**
	 * 휴학신청내역 상세조회
	 * @return
	 */
	@RequestMapping("myStu.academic.detailOff")
	public String selectAdminAcademicOff(int asNo, Model m) {
		
		AcademicStatus as = acService.selectAs(asNo);
		ArrayList<Attachment> attList = acService.selectAttachmentList(asNo);
		m.addAttribute("as", as);
		m.addAttribute("attList", attList);
		
		return "academicStatus/stuAcademicDetailOff";
	}
	
	@RequestMapping("myStu.academic.detailBack")
	public String selectAdminAcademicBack() {
		return "academicStatus/stuAcademicDetailBack";
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
