package com.us.uni.board.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Board {
	 private int boardNo;
	 private int userNo;
	 private int userDivision;
	 private String boardTitle;
	 private String boardContent;
	 private int boCount;
	 private String createDate;
	 private String noticeYN;
	 private String deleteYN;
	 private int boCategory;
	 private int subCategory;
}
