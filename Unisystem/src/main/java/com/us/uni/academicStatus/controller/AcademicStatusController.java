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
import com.us.uni.appointment.model.vo.Appointment;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
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
	 * 복학신청시 휴학신청 데이터 불러오는 컨트롤러
	 * @param userNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="myProf.selectOffApply", produces="application/json; charset=UTF-8")
	public AcademicStatus selectOffAply(int userNo) {
		
		AcademicStatus as = acService.selectOffApply(userNo);
		
		return as;
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
	
	/**
	 * 교수 마이페이지 학적변동 신청내역 리스트 조회 페이지 컨트롤러
	 * @param currentPage
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("myProf.academic.list")
	public String selectProfAcademicList(int currentPage, HttpSession session, Model m) {
		
		Users u = (Users)session.getAttribute("loginUser");
		
		int listCount = acService.selectProfAsListCount(u.getUserNo());
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AcademicStatus> asList = acService.selectProfAsList(u.getUserNo(), pi);
		m.addAttribute("asList", asList);
		m.addAttribute("pi", pi);
		
		return "academicStatus/profAcademicList";
	}
	
	/**
	 * 학생 휴학신청내역 상세조회
	 * @return
	 */
	@RequestMapping("myStu.academic.detailOff")
	public String selectStudAcademicOff(int asNo, Model m) {
	
		AcademicStatus as = acService.selectAs(asNo);
		ArrayList<Attachment> attList = acService.selectAttachmentList(asNo);
		
		m.addAttribute("as", as);
		m.addAttribute("attList", attList);
		
		return "academicStatus/stuAcademicDetailOff";
	}
	
	/**
	 * 교수 휴학신청내역 상세조회
	 * @return
	 */
	@RequestMapping("myProf.academic.detailOff")
	public String selectProfAcademicOff(int asNo, int studNo, Model m) {
		
		Users s = acService.selectStudInfo(studNo);
		AcademicStatus as = acService.selectAs(asNo);
		ArrayList<Attachment> attList = acService.selectAttachmentList(asNo);
		
		m.addAttribute("s", s);
		m.addAttribute("as", as);
		m.addAttribute("attList", attList);
		System.out.println(s.getStudStatus());
		return "academicStatus/profAcademicDetailOff";
	}
	
	/**
	 * 학생 복학신청내역 상세조회
	 * @param session
	 * @param asNo
	 * @param m
	 * @return
	 */
	@RequestMapping("myStu.academic.detailBack")
	public String selectSutdAcademicBack(HttpSession session, int asNo, Model m) {
		
		Users u = (Users)session.getAttribute("loginUser");
		AcademicStatus asOff = acService.selectOffApply(u.getUserNo());
		AcademicStatus asBack = acService.selectAs(asNo);
		m.addAttribute("asOff", asOff);
		m.addAttribute("asBack", asBack);
		
		System.out.println(asOff);
		System.out.println(asBack);
		return "academicStatus/stuAcademicDetailBack";
	}
	
	/**
	 * 교수복학신청내역 상세조회
	 * @param session
	 * @param asNo
	 * @param m
	 * @return
	 */
	@RequestMapping("myProf.academic.detailBack")
	public String selectProfAcademicBack(HttpSession session, int studNo, int asNo, Model m) {
		
		Users s = acService.selectStudInfo(studNo);
		Users u = (Users)session.getAttribute("loginUser");
		AcademicStatus asOff = acService.selectOffApply(u.getUserNo());
		AcademicStatus asBack = acService.selectAs(asNo);
		
		m.addAttribute("s", s);
		m.addAttribute("asOff", asOff);
		m.addAttribute("asBack", asBack);
		
		return "academicStatus/profAcademicDetailBack";
	}
	
	/**
	 * 관리자 학적변동 신청내역 리스트 조회 페이지 컨트롤러
	 * @param currentPage
	 * @param session
	 * @param m
	 * @return
	 */
	@RequestMapping("admin.academic.list")
	public String selectAdminAcademicList(int currentPage, Model m) {
		
		int listCount = acService.selectAdminAsListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<AcademicStatus> asList = acService.selectAdminAsList(pi);
		m.addAttribute("asList", asList);
		m.addAttribute("pi", pi);
		
		return  "academicStatus/adminAcademicList";
	}
		
	/**
	 * 상태변경용 ajax 컨트롤러
	 * @param a
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="myProf.changeAsStatus", produces="application/json; charset=UTF-8")
	public int changeAsStatus(AcademicStatus as) {
		
		int result = acService.changeAsStatus(as);
		
		return result;
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
