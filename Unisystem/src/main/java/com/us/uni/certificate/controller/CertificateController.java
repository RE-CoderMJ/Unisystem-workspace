package com.us.uni.certificate.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.us.uni.certificate.model.service.CertificateService;
import com.us.uni.certificate.model.vo.Certificate;
import com.us.uni.users.model.vo.Users;

@Controller
public class CertificateController {
	
	@Autowired
	private CertificateService cService;
	
	/**
	 * 증명서 신청 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("myStu.cert.apply")
	public String applyCertPage() {
		return "certificate/applyCert";
	}
	
	/**
	 * 증명서 신청 접수 컨트롤러
	 * @param c
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="myStu.cert.applyCert", produces="application/json; charset=UTF-8")
	public int applyCert(Certificate c){
		
		int result = cService.applyCert(c);
		
		return result;
	}
	
	/**
	 * 증명서 신청 접수내역 리스트 조회 컨트롤러
	 * @param studNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="myStu.cert.selectCertList", produces="application/json; charset=UTF-8")
	public String selectCertList(int studNo){
		
		ArrayList<Certificate> list = cService.selectCertList(studNo);
		
		return new Gson().toJson(list);
	}
	
	/**
	 * 증명서 발급 신청 접수내역 삭제 컨트롤러
	 * @param cerNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="myStu.cert.deleteCert", produces="application/json; charset=UTF-8")
	public int deleteCert(int cerNo) {
		
		int result = cService.deleteCert(cerNo);
		
		return result;
	}
	
	/**
	 * 결제페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("myStu.cert.payment")
	public String payForCert(HttpSession session, Model m) {
		
		Users u = (Users)session.getAttribute("loginUser");
		
		ArrayList<Certificate> list = cService.selectCertList(u.getUserNo());
		m.addAttribute("list", list);
		
		return "certificate/paymentCert";
	}
	
	/**
	 * 결제 완료 후 출력 페이지 컨트롤러
	 * @return
	 */
	@RequestMapping("myStu.cert.list")
	public String selectCerts() {
		return "certificate/listCert";
	}
	
	/**
	 * 결제정보 업데이트 컨트롤러
	 * @param cerNoList
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="myStu.cert.payment", produces="application/json; charset=UTF-8")
	public int updatePayment(ArrayList<Certificate> cerNoList) {
		
		System.out.println(cerNoList);
		int result = 0;
		/*
		for(int cerNo:cerNoList) {
			result = cService.updatePayment(cerNo);
		}
		*/
		return result;
	}
	
	/**
	 * 졸업증명서(국문)
	 * @return
	 */
	@RequestMapping("myStu.cert.gradCert/kor")
	public String gradCertKor() {
		return "certificate/korGradCert";
	}
	
	/**
	 * 졸업증명서(영문)
	 * @return
	 */
	@RequestMapping("myStu.cert.gradCert/eng")
	public String gradCertEng() {
		return "certificate/engGradCert";
	}
	
	/**
	 * 재학증명서(국문)
	 * @return
	 */
	@RequestMapping("myStu.cert.enrollCert/kor")
	public String EnrollCertKor() {
		return "certificate/korEnrollCert";
	}
	
	/**
	 * 재학증명서(영문)
	 * @return
	 */
	@RequestMapping("myStu.cert.enrollCert/eng")
	public String EnrollCertEng() {
		return "certificate/engEnrollCert";
	}
	
}
