package com.us.uni.academicStatus.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor	
@Setter
@Getter
@ToString
public class AcademicStatus {
	
	private int asNo;
	private int studNo;
	private int asType;
	private String asTypeT;
	private String asDate;
	private int offType;
	private String offTypeT;
	private int reason;
	private String reasonT;
	private String reasonDetail;
	private int offYear;
	private int offSemester;
	private int offUntilYear;
	private int offUntilSemester;
	private int backYear;
	private int backSemester;
	private int progress;
	private String progressT;
	private String status;
	private String studName;
}
