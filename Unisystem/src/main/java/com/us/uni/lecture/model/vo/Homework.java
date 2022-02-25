package com.us.uni.lecture.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter 
@Getter
@ToString
public class Homework {
	
	
	// HOMEWORKP (교수가 낸 과제)
	private String homeworkpNo;             // 과제번호(seq) or 참조게시글번호
	private int classNo;					// 강의번호
	private String homeworkpName;			// 과제명
	private String homeworkpCategory;		// 제출가능(P) | 제출마감(I)
	private String homeworkpEndDateTime;    // 마감일시
	private String pstatus;                 // 게시여부(Y|N)
	private String homeworkpContent;		// 내용
	
	// HOMEWORKS (학생이 제출한 과제)
	private int homeworksNo;				// 과제번호(seq)
	private int studNo;                     // 학번
	private String gradeStatus;             // 채점(A) | 미채점(B)
	private int score;						// 점수
	private String feedback;				// 피드백
	private String sstatus;					// 게시여부(Y|N)
	
	private String korName;
	private int rownum;
	private int countHW;					// 제출상황 총 개수
	private int countGHW;					// 채점상황 총 개수
	
}
