package com.us.uni.user.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class User {
	 private int userNo;
	 private String password;
	 private String koreaName;
	 private String engName;
	 private String birthday;
	 private String gender;
	 private String email;
	 private String phone;
	 private String address;
	 private String nation;
	 private String webMail;
	 private int userDiv;
	 private String profileImg;
}
