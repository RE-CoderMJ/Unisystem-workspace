package com.us.uni.message.model.vo;

public class Message {
	
	 private int messageNo;
	 private String msgWriter;
	 private String msgReader;
	 private String msgContent;
	 private String readYN;
	 private String deleteYN;
	 private String impMsg;
	 private String sendDate;
	 private String readDate;
	 private String msgAlert;
	 private int userNo;
	 
	 public Message() {}

	public Message(int messageNo, String msgWriter, String msgReader, String msgContent, String readYN, String deleteYN,
			String impMsg, String sendDate, String readDate, String msgAlert, int userNo) {
		super();
		this.messageNo = messageNo;
		this.msgWriter = msgWriter;
		this.msgReader = msgReader;
		this.msgContent = msgContent;
		this.readYN = readYN;
		this.deleteYN = deleteYN;
		this.impMsg = impMsg;
		this.sendDate = sendDate;
		this.readDate = readDate;
		this.msgAlert = msgAlert;
		this.userNo = userNo;
	}

	public int getMessageNo() {
		return messageNo;
	}

	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}

	public String getMsgWriter() {
		return msgWriter;
	}

	public void setMsgWriter(String msgWriter) {
		this.msgWriter = msgWriter;
	}

	public String getMsgReader() {
		return msgReader;
	}

	public void setMsgReader(String msgReader) {
		this.msgReader = msgReader;
	}

	public String getMsgContent() {
		return msgContent;
	}

	public void setMsgContent(String msgContent) {
		this.msgContent = msgContent;
	}

	public String getReadYN() {
		return readYN;
	}

	public void setReadYN(String readYN) {
		this.readYN = readYN;
	}

	public String getDeleteYN() {
		return deleteYN;
	}

	public void setDeleteYN(String deleteYN) {
		this.deleteYN = deleteYN;
	}

	public String getImpMsg() {
		return impMsg;
	}

	public void setImpMsg(String impMsg) {
		this.impMsg = impMsg;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}

	public String getMsgAlert() {
		return msgAlert;
	}

	public void setMsgAlert(String msgAlert) {
		this.msgAlert = msgAlert;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Message [messageNo=");
		builder.append(messageNo);
		builder.append(", msgWriter=");
		builder.append(msgWriter);
		builder.append(", msgReader=");
		builder.append(msgReader);
		builder.append(", msgContent=");
		builder.append(msgContent);
		builder.append(", readYN=");
		builder.append(readYN);
		builder.append(", deleteYN=");
		builder.append(deleteYN);
		builder.append(", impMsg=");
		builder.append(impMsg);
		builder.append(", sendDate=");
		builder.append(sendDate);
		builder.append(", readDate=");
		builder.append(readDate);
		builder.append(", msgAlert=");
		builder.append(msgAlert);
		builder.append(", userNo=");
		builder.append(userNo);
		builder.append("]");
		return builder.toString();
	}

	 

	
}
