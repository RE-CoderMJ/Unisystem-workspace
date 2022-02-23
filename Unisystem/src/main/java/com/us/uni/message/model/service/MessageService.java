package com.us.uni.message.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.message.model.vo.Message;


@Service
public interface MessageService {

	//받은메시지리스트 조회 
	int selectMsgListCount(int userNo);
	ArrayList<Message> selectMsgList(int userNo, PageInfo pi);

	//보낸
	int SendMsgListCount(int userNo);
	ArrayList<Message> SendMsgList(int userNo, PageInfo pi);
}