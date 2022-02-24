package com.us.uni.message.model.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.us.uni.common.model.vo.PageInfo;
import com.us.uni.message.model.vo.Message;


@Service
public interface MessageService {

	//받은메시지리스트 조회 
	int selectMsgListCount(int userNo);
	ArrayList<Message> selectMsgList(PageInfo pi,int userNo);

	//보낸
	int sendMsgListCount(int userNo);
	ArrayList<Message> sendMsgList(int userNo,PageInfo pi);
	int sendMessage(Message msg);
	int readDate(int messageNo);
	Message rdetailMsg(int messageNo);
	Message sdetailMsg(int messageNo);
	int deleteMsg(Message m);
}