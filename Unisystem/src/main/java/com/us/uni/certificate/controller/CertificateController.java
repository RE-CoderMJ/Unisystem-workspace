package com.us.uni.certificate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CertificateController {
	
	@RequestMapping("myStu.cert.apply")
	public String applyCert() {
		return "certificate/applyCert";
	}
	
	@RequestMapping("myStu.cert.payment")
	public String payForCert() {
		return "certificate/paymentCert";
	}
	
	@RequestMapping("myStu.cert.list")
	public String selectCerts() {
		return "certificate/listCert";
	}
}
