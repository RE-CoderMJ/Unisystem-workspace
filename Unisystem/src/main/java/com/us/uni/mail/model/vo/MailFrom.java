package com.us.uni.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


public class MailFrom {
	
	private int mailNo;
	private int mailToNo;
	private int userNo;
	private String userToNo;
	private String address;
	private String title;
	private String content;
	private String sendDate;
	private String readDate;
	private String toMe;
	private String saveStatus;
	private String fileName;
	private String important;
	private String fromName;
	private String userToName;

public MailFrom() {}

public MailFrom(int mailNo, int mailToNo, int userNo, String userToNo, String address, String title, String content,
		String sendDate, String readDate, String toMe, String saveStatus, String fileName, String important,
		String fromName, String userToName) {
	super();
	this.mailNo = mailNo;
	this.mailToNo = mailToNo;
	this.userNo = userNo;
	this.userToNo = userToNo;
	this.address = address;
	this.title = title;
	this.content = content;
	this.sendDate = sendDate;
	this.readDate = readDate;
	this.toMe = toMe;
	this.saveStatus = saveStatus;
	this.fileName = fileName;
	this.important = important;
	this.fromName = fromName;
	this.userToName = userToName;
}

public int getMailNo() {
	return mailNo;
}

public void setMailNo(int mailNo) {
	this.mailNo = mailNo;
}

public int getMailToNo() {
	return mailToNo;
}

public void setMailToNo(int mailToNo) {
	this.mailToNo = mailToNo;
}

public int getUserNo() {
	return userNo;
}

public void setUserNo(int userNo) {
	this.userNo = userNo;
}

public String getUserToNo() {
	return userToNo;
}

public void setUserToNo(String userToNo) {
	this.userToNo = userToNo;
}

public String getAddress() {
	return address;
}

public void setAddress(String address) {
	this.address = address;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getContent() {
	return content;
}

public void setContent(String content) {
	this.content = content;
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

public String getToMe() {
	return toMe;
}

public void setToMe(String toMe) {
	this.toMe = toMe;
}

public String getSaveStatus() {
	return saveStatus;
}

public void setSaveStatus(String saveStatus) {
	this.saveStatus = saveStatus;
}

public String getFileName() {
	return fileName;
}

public void setFileName(String fileName) {
	this.fileName = fileName;
}

public String getImportant() {
	return important;
}

public void setImportant(String important) {
	this.important = important;
}

public String getFromName() {
	return fromName;
}

public void setFromName(String fromName) {
	this.fromName = fromName;
}

public String getUserToName() {
	return userToName;
}

public void setUserToName(String userToName) {
	this.userToName = userToName;
}

@Override
public String toString() {
	StringBuilder builder = new StringBuilder();
	builder.append("MailFrom [mailNo=");
	builder.append(mailNo);
	builder.append(", mailToNo=");
	builder.append(mailToNo);
	builder.append(", userNo=");
	builder.append(userNo);
	builder.append(", userToNo=");
	builder.append(userToNo);
	builder.append(", address=");
	builder.append(address);
	builder.append(", title=");
	builder.append(title);
	builder.append(", content=");
	builder.append(content);
	builder.append(", sendDate=");
	builder.append(sendDate);
	builder.append(", readDate=");
	builder.append(readDate);
	builder.append(", toMe=");
	builder.append(toMe);
	builder.append(", saveStatus=");
	builder.append(saveStatus);
	builder.append(", fileName=");
	builder.append(fileName);
	builder.append(", important=");
	builder.append(important);
	builder.append(", fromName=");
	builder.append(fromName);
	builder.append(", userToName=");
	builder.append(userToName);
	builder.append("]");
	return builder.toString();
}




}
