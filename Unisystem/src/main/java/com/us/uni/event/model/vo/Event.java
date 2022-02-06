package com.us.uni.event.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Event {

	 private int eventNo;
	 private int userNo;
	 private String eventTitle;
	 private String eventContent;
	 private String startDate;
	 private String endDate;
	 private String alldayYN;
	 private String deleteYN;
	
}
