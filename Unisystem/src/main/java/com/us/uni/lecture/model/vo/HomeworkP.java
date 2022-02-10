package com.us.uni.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class HomeworkP {
	
	private int homeworkpNo;                // 과제번호(seq)
	private int classNo;					// 강의번호
	private String homeworkpName;			// 과제명
	private String homeworkpCategory;		// 제출가능(P) | 제출마감(I)
	private String homeworkpEndDateTime;    // 마감일시
	private String status;                  // 게시여부(Y|N)
}
