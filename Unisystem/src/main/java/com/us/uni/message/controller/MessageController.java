package com.us.uni.message.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.common.template.Pagination;
import com.us.uni.message.model.vo.Message;

@Controller
public class MessageController {

	
	//private MessageService mService;
	
		//받은메시지 리스트
		@RequestMapping("list.msg")
		public ModelAndView selectList(@RequestParam(value="cpage",defaultValue="1")int currentPage, ModelAndView mv) {
			/*
			int listCount = mService.recSelectListCount();
			
			PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
			ArrayList<Message> list = mService.recSelectList(pi);
			
			//System.out.println(list);
			
			.addObject("pi", pi)
			  .addObject("list", list)*/
			mv.setViewName("message/receiveMsgList");
			
			return mv;
		}
}
