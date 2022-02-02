package com.us.uni.mail.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WebMailController {

	@RequestMapping("webMail")
	public String selectReceivedMails(){
		return "webMail/webMailView";
	}
}
