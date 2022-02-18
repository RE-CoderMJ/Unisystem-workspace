package com.us.uni.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MailFrom {
	
	private int mailNo;
	private int mailToNo;
	private int userNo;
	private String userToNo;
	private String address;
	private String title;
	private String content;
	private String sendDate;
	private String toMe;
	private String saveStatus;
	private String fileName;
	private String important;
	private String fromName;
	private String userToName;
}
