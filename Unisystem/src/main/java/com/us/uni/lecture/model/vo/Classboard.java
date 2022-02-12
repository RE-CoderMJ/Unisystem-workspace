package com.us.uni.lecture.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Classboard {
	
	private int classboardNo;            // 글번호
	private int classNo;                 // 강의번호
	private String classboardCategory;   // 공지사항(L) | 수업자료실(D) | 영상자료실(M)
	private String classboardTitle;      // 제목
	private String classboardContent;    // 내용
	private Date classboardEndDateTime;  // 최종작성일시
	private int count;                   // 조회수
	private String status;               // 게시여부(Y|N)
}
