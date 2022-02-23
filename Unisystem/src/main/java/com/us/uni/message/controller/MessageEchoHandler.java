package com.us.uni.message.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.us.uni.interceptor.SessionNames;
import com.us.uni.users.model.vo.Users;

public class MessageEchoHandler extends TextWebSocketHandler {
	
	 List<WebSocketSession> sessions = new ArrayList<>(); //접속되는 모든유저들이 담긴 list
	 Map<String,WebSocketSession> userSessions = new HashMap<>();
	 //로그인한 유저의 아이디를 알아야하므로 key-value 방식인 map으로 담는다  
	 //로그인했으면 세션의 Id, 아니면 소켓의 Id가 반환되므로(조건문으로 나눠줌) map을 put해주면 된다 [after-]부분에
	 
	 
	 
	@Override
	 public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		
		 System.out.println("afterConnectionEstablished : "+ session);
		 sessions.add(session); //ArrayList에 담긴 접속된 유저들을 추가
		 String senderId = getId(session); 
		 //senderId로 상단 map에 전역변수로 담아주고 전역변수로 선언한 usersessions를 아래에 put해준다

		 userSessions.put(senderId,session); //그러면 put 할 때 로그인했으면 세션의 Id, 아니면 소켓의 Id가 들어감 
		 
	 }
	 
	
	
	@Override
	 protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//개인 정보를 가져오기위해 웹소켓세션에서 HTTP세션으로 접근 해야한다 
		
		System.out.println("handleTextMessage : "+session + ":" + message); 
		// (1) 웹소켓이 정상적으로 접근가능한지 출력문 test
		 
		 /*접속한 모든 사용자에게 접근하는 for-loop
		 for(WebSocketSession sess : sessions) {
			 //String senderId = session.getId(); // (2)웹소켓 고유 가지고있는 아이디를 호출 해봄 
			 String senderId = getId(session); 
			 //websocket의 Id를 가져오는 구문이고 조건을 나눠주기 위해 아래에 메소드를  따로 만들어줌 
			 sess.sendMessage(new TextMessage(senderId + ":" + message.getPayload())); 
			 //getPayload() : 실제로 보낸 내용을 의미 
		 }*/
		
				/*특정 user에게 알림이 가도록 접근*/
		// (1)protocal설정 => cmd,댓글작성자,게시글작성자,bno  (예를들어 reply,user2,user1,bno)
		// (2) ArrayList로 담을거고 
		// (3) ,로 배열을 쪼개줄거임
		// (4) 메시지가 null이 아닐때만 실행되도록 조건처리 
		// (5) strs도 마찬가지로 조건처리(not null일때 실행되도록) && 4개의 배열이니까 길이가 4일때 실행되도록
		
		String msg = message.getPayload();
		
		if(StringUtils.isNotEmpty(msg)) {
			String[] strs = msg.split(",");
			if(strs != null && strs.length == 4) {
				String cmd = strs[0]; //배열의 0번째 -> (1)참고 
				String ruserNo = strs[1];
				String boardWriter = strs[2];
				String boardNo = strs[3];
				
				System.out.println("cmd"+cmd);
				System.out.println("boardWriter"+boardWriter);
				WebSocketSession boardWriterSession = userSessions.get(boardWriter); 
				
				//작성자가 접속중일때만 알람이 가도록 작성자 정보를 가져옴 -> 가져오면 웹소켓 세션을 가져옴 
				
				if(boardWriterSession != null) { //not null이면 메시지를 보내줌 
					TextMessage tmpMsg = new TextMessage(boardNo + "게시글에 댓글이 달렸습니다.");
					//text 출력되는 부분 -> 알맞게 수정하기 
					//메시지면 전송 클릭하는 순간 alert가 되도록 하고 header스크립트문을 text가 아니라 html로 수정하기 
					
					
					//System.out.println("ruserNo: "+ruserNo);
					//System.out.println("boardNo"+ boardNo);
					boardWriterSession.sendMessage(tmpMsg);
					
					System.out.println("tmpMsg : " + tmpMsg);
					
					 //이제 jsp ajax부분에가서 웹소켓으로 번호를 보내줘야하고 
					 //댓글에만 있던 js 부분을 전역으로 빼줘야함 
						}
					}
				}
	 		}

	private String getId(WebSocketSession session) {
		
		Map<String, Object> httpSession = session.getAttributes(); 
		//http세션에있는 값들=객체정보들을 map에  줄거임
		
		Users loginUser = (Users)httpSession.get(SessionNames.LOGIN);
		
		//System.out.println("loginUser:"+loginUser);
		
		if(loginUser == null) {
			//System.out.println(session.getId());
			return session.getId(); //webSocket session의 아이디
			
		} else {
			//System.out.println("loginUser번호 : "+""+loginUser.getUserNo()); //return됨
			return ""+loginUser.getUserNo(); //로그인 유저가 null이 아닐경우 -> 로그인 유저의 아이디를 return 
		}
		
	}





	@Override
	 public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		 //System.out.println("afterConnectionClosed : "+session +":"+ status);
	 }
	 
	 
}

