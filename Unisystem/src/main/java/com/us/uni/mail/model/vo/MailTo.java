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
}