package com.us.uni.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.message.model.service.MessageService;
import com.us.uni.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService mService;
	
	
	@RequestMapping("list.msg")
	public String selectReceivedMsg(){
		
		return "message/receiveMsgList";
	}
	
	@ResponseBody
	@RequestMapping(value="rmsg.list", produces="application/json; charset=UTF-8")
	public Map<String, Object> selectMsgList(int currentPage, int userNo) {
		Map<String, Object> map = new HashMap();
		int listCount = mService.selectMsgListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Message> list = mService.selectMsgList(pi,userNo);
		
		map.put("pi", pi);
		map.put("list", list);
		
		return map;
	}
	
	
	@RequestMapping("list.smsg")
	public String selectSendMsg(){
		
		return "message/sendMsgList";
	}
	
	@ResponseBody
	@RequestMapping(value="smsg.list", produces="application/json; charset=UTF-8")
	public Map<String, Object> sendMsgList(int currentPage, int userNo) {
		Map<String, Object> map = new HashMap();
		System.out.println(userNo);
		int listCount = mService.sendMsgListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Message> list = mService.sendMsgList(userNo,pi);
		System.out.println(list);
		
		map.put("pi", pi);
		map.put("list", list);
		System.out.println(map);
		
		return map;
	}
	
	
	
	
	
}
