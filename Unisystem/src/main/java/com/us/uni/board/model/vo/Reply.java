package com.us.uni.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Reply {
	 private int replyNo;
	 private int userNo;
	 private int boardNo;
	 private String replyContent;
	 private String createDate;
	 private String status;
}
