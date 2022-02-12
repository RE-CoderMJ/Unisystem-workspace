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
	private int userNo;
	private String address;
	private String important;
	private String readDate;
	private String status;
	private String spamStatus;
	private String ccStatus;
	
}
