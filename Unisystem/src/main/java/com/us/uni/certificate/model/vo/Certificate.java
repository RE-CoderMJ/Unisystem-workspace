package com.us.uni.certificate.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Certificate {

	private int cerNo;
	private int studNo;
	private int cerType;
	private String cerTypeT; 
	private String useFor;
	private int toType;
	private String toTypeT;
	private String toWhom;
	private String paid;
	private String status;
	private String issueDate;
}
