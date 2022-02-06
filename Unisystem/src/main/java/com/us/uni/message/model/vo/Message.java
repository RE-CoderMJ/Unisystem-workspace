package com.us.uni.message.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Message {
	
	 private int messageNo;
	 private String msgWriter;
	 private String msgReader;
	 private String msgContent;
	 private String readYN;
	 private String deleteYN;
	 private String impMsg;
	 private String sendDate;
	 private String readDate;
	 private String msgAlert;

}
