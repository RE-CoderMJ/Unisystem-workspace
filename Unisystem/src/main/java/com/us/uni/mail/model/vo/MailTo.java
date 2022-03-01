package com.us.uni.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailTo {
	
	private int mailNo;
	private int mailFromNo;
	private int userToNo;
	private String address;
	private int userFromNo;
	private String userFromAdd;
	private String important;
	private String readDate;
	private String sendDate;
	private String status;
	private String saveStatus;
	private String spamStatus;
	private String ccStatus;
	private String title;
	private String content;
	private String fileName;
	private String userFromName;
	private String userToName;
	private String type;
	private String toMe;
	
	public MailTo() {}

	public MailTo(int mailNo, int mailFromNo, int userToNo, String address, int userFromNo, String userFromAdd,
			String important, String readDate, String sendDate, String status, String saveStatus, String spamStatus,
			String ccStatus, String title, String content, String fileName, String userFromName, String userToName,
			String type, String toMe) {
		super();
		this.mailNo = mailNo;
		this.mailFromNo = mailFromNo;
		this.userToNo = userToNo;
		this.address = address;
		this.userFromNo = userFromNo;
		this.userFromAdd = userFromAdd;
		this.important = important;
		this.readDate = readDate;
		this.sendDate = sendDate;
		this.status = status;
		this.saveStatus = saveStatus;
		this.spamStatus = spamStatus;
		this.ccStatus = ccStatus;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.userFromName = userFromName;
		this.userToName = userToName;
		this.type = type;
		this.toMe = toMe;
	}

	public int getMailNo() {
		return mailNo;
	}

	public void setMailNo(int mailNo) {
		this.mailNo = mailNo;
	}

	public int getMailFromNo() {
		return mailFromNo;
	}

	public void setMailFromNo(int mailFromNo) {
		this.mailFromNo = mailFromNo;
	}

	public int getUserToNo() {
		return userToNo;
	}

	public void setUserToNo(int userToNo) {
		this.userToNo = userToNo;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getUserFromNo() {
		return userFromNo;
	}

	public void setUserFromNo(int userFromNo) {
		this.userFromNo = userFromNo;
	}

	public String getUserFromAdd() {
		return userFromAdd;
	}

	public void setUserFromAdd(String userFromAdd) {
		this.userFromAdd = userFromAdd;
	}

	public String getImportant() {
		return important;
	}

	public void setImportant(String important) {
		this.important = important;
	}

	public String getReadDate() {
		return readDate;
	}

	public void setReadDate(String readDate) {
		this.readDate = readDate;
	}

	public String getSendDate() {
		return sendDate;
	}

	public void setSendDate(String sendDate) {
		this.sendDate = sendDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getSaveStatus() {
		return saveStatus;
	}

	public void setSaveStatus(String saveStatus) {
		this.saveStatus = saveStatus;
	}

	public String getSpamStatus() {
		return spamStatus;
	}

	public void setSpamStatus(String spamStatus) {
		this.spamStatus = spamStatus;
	}

	public String getCcStatus() {
		return ccStatus;
	}

	public void setCcStatus(String ccStatus) {
		this.ccStatus = ccStatus;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getUserFromName() {
		return userFromName;
	}

	public void setUserFromName(String userFromName) {
		this.userFromName = userFromName;
	}

	public String getUserToName() {
		return userToName;
	}

	public void setUserToName(String userToName) {
		this.userToName = userToName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getToMe() {
		return toMe;
	}

	public void setToMe(String toMe) {
		this.toMe = toMe;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("MailTo [mailNo=");
		builder.append(mailNo);
		builder.append(", mailFromNo=");
		builder.append(mailFromNo);
		builder.append(", userToNo=");
		builder.append(userToNo);
		builder.append(", address=");
		builder.append(address);
		builder.append(", userFromNo=");
		builder.append(userFromNo);
		builder.append(", userFromAdd=");
		builder.append(userFromAdd);
		builder.append(", important=");
		builder.append(important);
		builder.append(", readDate=");
		builder.append(readDate);
		builder.append(", sendDate=");
		builder.append(sendDate);
		builder.append(", status=");
		builder.append(status);
		builder.append(", saveStatus=");
		builder.append(saveStatus);
		builder.append(", spamStatus=");
		builder.append(spamStatus);
		builder.append(", ccStatus=");
		builder.append(ccStatus);
		builder.append(", title=");
		builder.append(title);
		builder.append(", content=");
		builder.append(content);
		builder.append(", fileName=");
		builder.append(fileName);
		builder.append(", userFromName=");
		builder.append(userFromName);
		builder.append(", userToName=");
		builder.append(userToName);
		builder.append(", type=");
		builder.append(type);
		builder.append(", toMe=");
		builder.append(toMe);
		builder.append("]");
		return builder.toString();
	}
	
	
}