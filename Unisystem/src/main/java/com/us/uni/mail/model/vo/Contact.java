package com.us.uni.mail.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Contact {
	private int contactNo;
	private int userNo;
	private String name;
	private String email;
	private String phone;
}
