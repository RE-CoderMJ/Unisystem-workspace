package com.us.uni.appointment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Setter
@Getter
@ToString
public class Appointment {
	private int appNo;
	private int studNo;
	private int profNo;
	private String title; 
	private String content;
	private String enrollDate;
	private String appDate;
	private int appStatus;
	private String reason;
	private String status;
	private String profName;
	private String studName;
	private String appTime;
}
