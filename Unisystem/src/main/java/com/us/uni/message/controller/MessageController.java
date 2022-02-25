package com.us.uni.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.us.uni.board.model.vo.Board;
import com.us.uni.common.model.vo.Attachment;
import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.message.model.service.MessageService;
import com.us.uni.message.model.vo.Message;

@Controller
public class MessageController {
	
	@Autowired
	private MessageService mService;
	
	//받은메시지 조회 
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
	
	
	//보낸메시지 조회 
	@RequestMapping("list.smsg")
	public String selectSendMsg(){
		
		return "message/sendMsgList";
	}
	
	@ResponseBody
	@RequestMapping(value="smsg.list", produces="application/json; charset=UTF-8")
	public Map<String, Object> sendMsgList(int currentPage, int userNo) {
		Map<String, Object> map = new HashMap();
		//System.out.println(userNo);
		int listCount = mService.sendMsgListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 10);
		ArrayList<Message> list = mService.sendMsgList(userNo,pi);
		//System.out.println(list);
		
		map.put("pi", pi);
		map.put("list", list);
		//System.out.println(map);
		
		return map;
	}
	
	//메시지 전송 
	@RequestMapping(value="sendMsg")
	public String sendMessage(Message msg, HttpSession session, Model model) {
		
		//System.out.println(msg);
		
		int result = mService.sendMessage(msg);
		
		if(result > 0) {    
			session.setAttribute("alertMsg", "성공적으로 메시지가 전송되었습니다.");
			return "redirect:list.msg";
		}else {  
			model.addAttribute("errorMsg", "메시지 전송 실패");
			return "message/receiveMsgList";
		}
	}
	
	@ResponseBody
	@RequestMapping(value="detail.rmsg", produces="application/json; charset=UTF-8")
	public String ajaxrDetailMsg(int messageNo){
		
		Message msg = mService.rdetailMsg(messageNo);
			//System.out.println(list);
		return new Gson().toJson(msg);
	}
	
	@ResponseBody
	@RequestMapping(value="detail.smsg", produces="application/json; charset=UTF-8")
	public String ajaxrSendMsg(int messageNo){
		
		Message msg = mService.sdetailMsg(messageNo);
			//System.out.println(list);
		return new Gson().toJson(msg);
	}
	
	@ResponseBody
	@RequestMapping(value="del.msg", produces="application/json; charset=UTF-8")
	public int ajaxrdelMsg(Message m){
		//System.out.println(m);
		
		int result = mService.deleteMsg(m);
		return result;
	}
	
}
