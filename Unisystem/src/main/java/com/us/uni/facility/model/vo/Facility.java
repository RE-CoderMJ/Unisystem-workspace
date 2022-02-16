package com.us.uni.facility.model.vo;

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
public class Facility {
	
	private int rsvdNo;
	private int studNo;
	private String rsvdSpace;
	private int rsvdNum;
	private String rsvdDate;
	private String rsvdStart;
	private String rsvdEnd;
	private int rsvdStatus;

}
